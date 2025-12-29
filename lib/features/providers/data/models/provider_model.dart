import '../../domain/entities/provider.dart';

class ProviderModel extends Provider {
  const ProviderModel({
    required super.id,
    required super.name,
    required super.serviceId,
    required super.isApproved,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: json['id'],
      name: json['name'],
      serviceId: json['service_id'],
      isApproved: json['is_approved'],
    );
  }
}
