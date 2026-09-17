<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Symfony\Component\Console\Command\Command as SymfonyCommand;
use Throwable;

class KeepAliveCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:keep-alive {--once : Run a single ping instead of looping} {--interval=600 : Interval in seconds between pings}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Pings the application health check endpoint to prevent Render free-tier idle spin-down';

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        $baseUrl = env('RENDER_EXTERNAL_URL') ?: config('app.url');
        
        if (empty($baseUrl)) {
            $this->error('Neither RENDER_EXTERNAL_URL nor APP_URL is configured.');
            return SymfonyCommand::FAILURE;
        }

        $pingUrl = rtrim($baseUrl, '/') . '/healthz';
        $interval = (int) $this->option('interval');
        $runOnce = (bool) $this->option('once');

        $this->info("[KeepAlive] Target URL: {$pingUrl}");

        do {
            try {
                $response = Http::timeout(10)->get($pingUrl);
                $status = $response->status();
                $this->info("[KeepAlive] Self-ping successful -> HTTP {$status} [" . now()->toDateTimeString() . ']');
            } catch (Throwable $e) {
                $this->warn("[KeepAlive] Self-ping warning: " . $e->getMessage() . " [" . now()->toDateTimeString() . ']');
            }

            if ($runOnce) {
                break;
            }

            sleep($interval);
        } while (true);

        return SymfonyCommand::SUCCESS;
    }
}
