import '../../../../core/usecase/usecase.dart';
import '../../../../core/enums/booking_status.dart';
import '../repositories/booking_repository.dart';

class UpdateBookingStatusParams {
  final String bookingId;
  final BookingStatus status;

  UpdateBookingStatusParams(this.bookingId, this.status);
}

class UpdateBookingStatus
    implements UseCase<void, UpdateBookingStatusParams> {
  final BookingRepository repository;

  UpdateBookingStatus(this.repository);

  @override
  Future<void> call(UpdateBookingStatusParams params) {
    return repository.updateBookingStatus(
      params.bookingId,
      params.status,
    );
  }
}
