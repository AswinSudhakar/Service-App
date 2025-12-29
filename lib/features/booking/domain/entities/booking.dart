import '../../../../core/enums/booking_status.dart';

class Booking {
  final String id;
  final String userId;
  final String serviceId;
  final String providerId;
  final DateTime date;
  final BookingStatus status;

  const Booking({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.providerId,
    required this.date,
    required this.status,
  });
}
