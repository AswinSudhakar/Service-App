import '../../../../core/enums/booking_status.dart';
import '../../domain/entities/booking.dart';

class BookingModel extends Booking {
  const BookingModel({
    required super.id,
    required super.userId,
    required super.serviceId,
    required super.providerId,
    required super.date,
    required super.status,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      userId: json['user_id'],
      serviceId: json['service_id'],
      providerId: json['provider_id'],
      date: DateTime.parse(json['date']),
      status: BookingStatus.values.byName(json['status']),
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'service_id': serviceId,
        'provider_id': providerId,
        'date': date.toIso8601String(),
        'status': status.name,
      };
}
