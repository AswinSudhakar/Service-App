import '../entities/service.dart';
import '../entities/service_category.dart';

abstract class ServiceRepository {
  Future<List<ServiceCategory>> getCategories();
  Future<List<Service>> getServicesByCategory(String categoryId);
  Future<Service> getServiceDetail(String serviceId);
  Future<void> updateServiceStatus(String serviceId, bool isActive);
}
