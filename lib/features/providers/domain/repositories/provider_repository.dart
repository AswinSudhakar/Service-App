import '../entities/provider.dart';

abstract class ProviderRepository {
  Future<List<Provider>> getProvidersByService(String serviceId);
  Future<List<Provider>> getPendingProviders();
  Future<void> approveProvider(String providerId);
}
