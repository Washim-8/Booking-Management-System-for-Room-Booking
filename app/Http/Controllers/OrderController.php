<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\RoomType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller {

    public function __construct() {
        $this->middleware('auth');
    }

    public function index() {
        $user = Auth::user();

        $orders = $user->orders()->with('room.roomtype')->orderBy('check_in', 'DESC')->get();
        return view('pages.list-orders', ['orders' => $orders]);
    }

    public function store(Request $request) {
        $user = Auth::user();
        
        $validated = $request->validate([
            'check_in' => ['required', 'date', 'after_or_equal:today'],
            'check_out' => ['required', 'date', 'after:check_in'],
            'room_id' => ['required', 'exists:rooms,id']
        ]);

        // Check room availability
        $room = \App\Models\Room::findOrFail($validated['room_id']);
        
        $overlappingBookings = Order::where('room_id', $validated['room_id'])
            ->where(function ($query) use ($validated) {
                $query->whereBetween('check_in', [$validated['check_in'], $validated['check_out']])
                    ->orWhereBetween('check_out', [$validated['check_in'], $validated['check_out']])
                    ->orWhere(function ($q) use ($validated) {
                        $q->where('check_in', '<=', $validated['check_in'])
                          ->where('check_out', '>=', $validated['check_out']);
                    });
            })
            ->count();

        if ($overlappingBookings >= $room->total_room) {
            return back()->withErrors([
                'booking_error' => 'Sorry, this room is not available for the selected dates.'
            ])->withInput();
        }

        $order = new Order($validated);
        $user->orders()->save($order);

        return redirect()->route('orders.index')
            ->with('message', 'Your booking has been created successfully!');
    }
}
