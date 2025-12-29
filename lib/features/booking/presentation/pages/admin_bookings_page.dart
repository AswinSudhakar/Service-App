import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/booking_status.dart';
import '../bloc/booking_bloc.dart';
import '../bloc/booking_event.dart';
import '../bloc/booking_state.dart';

class AdminBookingsPage extends StatelessWidget {
  const AdminBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Bookings')),
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (_, state) {
          if (state is BookingsLoaded) {
            return ListView.builder(
              itemCount: state.bookings.length,
              itemBuilder: (_, i) {
                final b = state.bookings[i];
                return ListTile(
                  title: Text(b.id),
                  trailing: DropdownButton<BookingStatus>(
                    value: b.status,
                    items: BookingStatus.values
                        .map(
                          (s) => DropdownMenuItem(
                            value: s,
                            child: Text(s.name),
                          ),
                        )
                        .toList(),
                    onChanged: (s) {
                      if (s != null) {
                        context.read<BookingBloc>().add(
                              ChangeBookingStatus(b.id, s),
                            );
                      }
                    },
                  ),
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
