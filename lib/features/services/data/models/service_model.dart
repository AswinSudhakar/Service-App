import '../../domain/entities/service.dart';

class ServiceModel extends Service {
  const ServiceModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.description,
    required super.isActive,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
    );
  }
}
