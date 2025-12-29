import '../../../../core/usecase/usecase.dart';
import '../entities/service.dart';
import '../repositories/service_repository.dart';

class GetServicesByCategory
    implements UseCase<List<Service>, String> {
  final ServiceRepository repository;

  GetServicesByCategory(this.repository);

  @override
  Future<List<Service>> call(String categoryId) {
    return repository.getServicesByCategory(categoryId);
  }
}
