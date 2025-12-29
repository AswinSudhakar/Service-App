import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/booking_bloc.dart';
import '../bloc/booking_event.dart';
import '../bloc/booking_state.dart';

class BookingHistoryPage extends StatelessWidget {
  final String userId;

  const BookingHistoryPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    context.read<BookingBloc>().add(LoadUserBookings(userId));

    return Scaffold(
      appBar: AppBar(title: const Text('My Bookings')),
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (_, state) {
          if (state is BookingsLoaded) {
            return ListView.builder(
              itemCount: state.bookings.length,
              itemBuilder: (_, i) {
                final b = state.bookings[i];
                return ListTile(
                  title: Text(b.serviceId),
                  subtitle: Text(b.status.name),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
