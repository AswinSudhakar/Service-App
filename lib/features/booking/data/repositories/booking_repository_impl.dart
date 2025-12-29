import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasources/booking_remote_datasource.dart';
import '../models/booking_model.dart';
import '../../../../core/enums/booking_status.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remote;

  BookingRepositoryImpl(this.remote);

  @override
  Future<void> createBooking(Booking booking) {
    return remote.createBooking(
      BookingModel(
        id: '',
        userId: booking.userId,
        serviceId: booking.serviceId,
        providerId: booking.providerId,
        date: booking.date,
        status: booking.status,
      ),
    );
  }

  @override
  Future<List<Booking>> getUserBookings(String userId) {
    return remote.getUserBookings(userId);
  }

  @override
  Future<void> updateBookingStatus(
    String bookingId,
    BookingStatus status,
  ) {
    return remote.updateBookingStatus(bookingId, status);
  }
}
