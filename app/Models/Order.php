<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Order extends Model {

    use HasFactory;

    protected $fillable = [
        'check_in',
        'check_out',
        'room_id',
        'user_id',
    ];

    protected $appends = ['stayDays'];

    protected $casts = [
        'check_in' => 'datetime',
        'check_out' => 'datetime',
    ];

    /**
     * Get the room associated with this order.
     */
    public function room(): BelongsTo {
        return $this->belongsTo(Room::class, 'room_id', 'id');
    }

    /**
     * Get the user who made this booking.
     */
    public function user(): BelongsTo {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    /**
     * Calculate the number of days for the stay.
     */
    public function getStayDaysAttribute(): int {
        return $this->check_in->diffInDays($this->check_out);
    }

    /**
     * Calculate the total cost of the booking.
     */
    public function getTotalCostAttribute(): float {
        return $this->room->price * $this->stayDays;
    }
}
