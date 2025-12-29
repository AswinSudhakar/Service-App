import '../../../../core/usecase/usecase.dart';
import '../entities/provider.dart';
import '../repositories/provider_repository.dart';

class GetProvidersByService
    implements UseCase<List<Provider>, String> {
  final ProviderRepository repository;

  GetProvidersByService(this.repository);

  @override
  Future<List<Provider>> call(String serviceId) {
    return repository.getProvidersByService(serviceId);
  }
}
