import '../entities/booking.dart';
import '../../../../core/enums/booking_status.dart';

abstract class BookingRepository {
  Future<void> createBooking(Booking booking);
  Future<List<Booking>> getUserBookings(String userId);
  Future<void> updateBookingStatus(
    String bookingId,
    BookingStatus status,
  );
}
