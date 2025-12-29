import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/create_booking.dart';
import '../../domain/usecases/get_user_bookings.dart';
import '../../domain/usecases/update_booking_status.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final CreateBooking createBooking;
  final GetUserBookings getUserBookings;
  final UpdateBookingStatus updateBookingStatus;

  BookingBloc({
    required this.createBooking,
    required this.getUserBookings,
    required this.updateBookingStatus,
  }) : super(BookingLoading()) {
    on<CreateBookingEvent>((event, emit) async {
      emit(BookingLoading());
      try {
        await createBooking(event.booking);
        emit(BookingSuccess());
      } catch (e) {
        emit(BookingError(e.toString()));
      }
    });

    on<LoadUserBookings>((event, emit) async {
      emit(BookingLoading());
      try {
        emit(BookingsLoaded(
          await getUserBookings(event.userId),
        ));
      } catch (_) {
        emit(BookingError('Failed to load bookings'));
      }
    });

    on<ChangeBookingStatus>((event, emit) async {
      await updateBookingStatus(
        UpdateBookingStatusParams(
          event.bookingId,
          event.status,
        ),
      );
    });
  }
}
