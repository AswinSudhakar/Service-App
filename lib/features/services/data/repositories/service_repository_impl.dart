import '../../domain/entities/service.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/repositories/service_repository.dart';
import '../datasources/service_remote_datasource.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource remote;

  ServiceRepositoryImpl(this.remote);

  @override
  Future<List<ServiceCategory>> getCategories() {
    return remote.getCategories();
  }

  @override
  Future<List<Service>> getServicesByCategory(String categoryId) {
    return remote.getServicesByCategory(categoryId);
  }

  @override
  Future<Service> getServiceDetail(String serviceId) {
    return remote.getServiceDetail(serviceId);
  }

  @override
  Future<void> updateServiceStatus(String serviceId, bool isActive) {
    return remote.updateServiceStatus(serviceId, isActive);
  }
}
