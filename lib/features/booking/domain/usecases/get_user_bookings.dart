import '../../../../core/usecase/usecase.dart';
import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetUserBookings
    implements UseCase<List<Booking>, String> {
  final BookingRepository repository;

  GetUserBookings(this.repository);

  @override
  Future<List<Booking>> call(String userId) {
    return repository.getUserBookings(userId);
  }
}
