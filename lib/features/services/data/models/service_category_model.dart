import '../../domain/entities/service_category.dart';

class ServiceCategoryModel extends ServiceCategory {
  const ServiceCategoryModel({
    required super.id,
    required super.name,
  });

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    return ServiceCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
