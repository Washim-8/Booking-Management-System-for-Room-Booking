@extends('layouts.app')

@section('content')
    <div class="card">
        <div class="card-header">
            <h2>Upcoming Booking</h2>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Room Name</th>
                    <th scope="col">Check in</th>
                    <th scope="col">Check out</th>
                    <th scope="col">Total price</th>
                    <th scope="col">Booked on</th>
                </tr>
                </thead>
                <tbody>
                @if(count($orders) > 0)
                @foreach($orders as $order)
                    <tr>
                        <td>{{ $order->room->roomtype->name }}</td>
                        <td>{{ $order->check_in }}</td>
                        <td>{{ $order->check_out }}</td>
                        <td>₹{{ $order->room->price * $order->stayDays }}</td>
                        <td>{{ $order->created_at }}</td>
                    </tr>
                @endforeach
                @else
                    <p class="text-primary fw-bold">You don't have any orders.</p>
                @endif
                </tbody>
            </table>
        </div>
    </div>
@endsection
