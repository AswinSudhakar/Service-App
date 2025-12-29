import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/booking_status.dart';
import '../../domain/entities/booking.dart';
import '../bloc/booking_bloc.dart';
import '../bloc/booking_event.dart';

class BookServicePage extends StatelessWidget {
  final String userId;
  final String serviceId;
  final String providerId;

  const BookServicePage({
    super.key,
    required this.userId,
    required this.serviceId,
    required this.providerId,
  });

  @override
  Widget build(BuildContext context) {
    final selectedDate = DateTime.now().add(const Duration(days: 1));

    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Booking')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<BookingBloc>().add(
                  CreateBookingEvent(
                    Booking(
                      id: '',
                      userId: userId,
                      serviceId: serviceId,
                      providerId: providerId,
                      date: selectedDate,
                      status: BookingStatus.pending,
                    ),
                  ),
                );
          },
          child: const Text('Confirm'),
        ),
      ),
    );
  }
}
