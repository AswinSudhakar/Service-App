import 'package:equatable/equatable.dart';
import '../../../../core/enums/booking_status.dart';
import '../../domain/entities/booking.dart';

abstract class BookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateBookingEvent extends BookingEvent {
  final Booking booking;
  CreateBookingEvent(this.booking);
}

class LoadUserBookings extends BookingEvent {
  final String userId;
  LoadUserBookings(this.userId);
}

class ChangeBookingStatus extends BookingEvent {
  final String bookingId;
  final BookingStatus status;

  ChangeBookingStatus(this.bookingId, this.status);
}
