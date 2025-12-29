import '../../../../core/usecase/usecase.dart';
import '../entities/provider.dart';
import '../repositories/provider_repository.dart';

class GetPendingProviders
    implements UseCase<List<Provider>, NoParams> {
  final ProviderRepository repository;

  GetPendingProviders(this.repository);

  @override
  Future<List<Provider>> call(NoParams params) {
    return repository.getPendingProviders();
  }
}
