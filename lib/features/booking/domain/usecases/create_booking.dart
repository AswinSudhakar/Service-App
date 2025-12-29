import '../../../../core/usecase/usecase.dart';
import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class CreateBooking implements UseCase<void, Booking> {
  final BookingRepository repository;

  CreateBooking(this.repository);

  @override
  Future<void> call(Booking booking) {
    return repository.createBooking(booking);
  }
}
