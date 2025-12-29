import '../../../../core/usecase/usecase.dart';
import '../entities/service.dart';
import '../repositories/service_repository.dart';

class GetServiceDetail implements UseCase<Service, String> {
  final ServiceRepository repository;

  GetServiceDetail(this.repository);

  @override
  Future<Service> call(String serviceId) {
    return repository.getServiceDetail(serviceId);
  }
}
