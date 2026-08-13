<?php

namespace App\Http\Controllers;

use App\Models\Room;
use App\Models\RoomType;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PageController extends Controller {

    public function index(): View {

        $rooms = Room::with('roomtype')->where('status', 1)->get();
        return view('pages.home', compact('rooms'));
    }

    public function list_rooms() {

        $rooms = Room::with('roomtype')->where('status', 1)->get();
        return view('pages.list-rooms', compact('rooms'));
    }

    public function search(Request $request) {

        $validatedData = $request->validate([
            'check_in' => ['required', 'date', 'after_or_equal:today'],
            'check_out' => ['required', 'date', 'after:check_in'],
            'no_peron' => ['required', 'integer', 'min:1']
        ]);

        // Get all active rooms
        $rooms = Room::with('roomtype')
            ->where('status', 1)
            ->where('no_beds', '>=', $validatedData['no_peron'])
            ->get()
            ->filter(function ($room) use ($validatedData) {
                // Count overlapping bookings for this room
                $overlappingBookings = Order::where('room_id', $room->id)
                    ->where(function ($query) use ($validatedData) {
                        // Check if booking dates overlap
                        $query->whereBetween('check_in', [$validatedData['check_in'], $validatedData['check_out']])
                            ->orWhereBetween('check_out', [$validatedData['check_in'], $validatedData['check_out']])
                            ->orWhere(function ($q) use ($validatedData) {
                                // Existing booking fully encompasses the search dates
                                $q->where('check_in', '<=', $validatedData['check_in'])
                                  ->where('check_out', '>=', $validatedData['check_out']);
                            });
                    })
                    ->count();

                // Room is available if overlapping bookings are less than total rooms
                return $overlappingBookings < $room->total_room;
            });

        $searched = true;
        $fields = $validatedData;
        session(['check_in' => $validatedData['check_in'], 'check_out' => $validatedData['check_out']]);
        
        return view('pages.list-rooms', compact('rooms', 'searched', 'fields'));
    }

    public function showProfile() {
        return view('pages.profile', ['user' => Auth::user()]);
    }

    public function updateProfile(Request $request) {
        $user = Auth::user();
        
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'last_name' => ['nullable', 'string', 'max:255'],
            'phone' => ['nullable', 'string', 'max:20']
        ]);
        
        $user->update($validated);

        return redirect()->route('profile')
            ->with('message', 'Profile updated successfully!');
    }
}
