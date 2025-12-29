import '../../domain/entities/provider.dart';
import '../../domain/repositories/provider_repository.dart';
import '../datasources/provider_remote_datasource.dart';

class ProviderRepositoryImpl implements ProviderRepository {
  final ProviderRemoteDataSource remote;

  ProviderRepositoryImpl(this.remote);

  @override
  Future<List<Provider>> getProvidersByService(String serviceId) {
    return remote.getProvidersByService(serviceId);
  }

  @override
  Future<List<Provider>> getPendingProviders() {
    return remote.getPendingProviders();
  }

  @override
  Future<void> approveProvider(String providerId) {
    return remote.approveProvider(providerId);
  }
}
