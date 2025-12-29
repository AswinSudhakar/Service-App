import 'package:equatable/equatable.dart';
import '../../domain/entities/booking.dart';

abstract class BookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {}

class BookingsLoaded extends BookingState {
  final List<Booking> bookings;
  BookingsLoaded(this.bookings);

  @override
  List<Object?> get props => [bookings];
}

class BookingError extends BookingState {
  final String message;
  BookingError(this.message);
}
