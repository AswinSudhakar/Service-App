import '../../../../core/usecase/usecase.dart';
import '../entities/service_category.dart';
import '../repositories/service_repository.dart';

class GetCategories implements UseCase<List<ServiceCategory>, NoParams> {
  final ServiceRepository repository;

  GetCategories(this.repository);

  @override
  Future<List<ServiceCategory>> call(NoParams params) {
    return repository.getCategories();
  }
}
