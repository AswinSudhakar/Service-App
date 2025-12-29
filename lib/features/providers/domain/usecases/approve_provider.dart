import '../../../../core/usecase/usecase.dart';
import '../repositories/provider_repository.dart';

class ApproveProvider implements UseCase<void, String> {
  final ProviderRepository repository;

  ApproveProvider(this.repository);

  @override
  Future<void> call(String providerId) {
    return repository.approveProvider(providerId);
  }
}
