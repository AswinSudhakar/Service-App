import '../../../../core/network/supabase_client.dart';
import '../../../../core/network/supabase_tables.dart';
import '../models/provider_model.dart';

class ProviderRemoteDataSource {
  final _client = SupabaseService.client;

  Future<List<ProviderModel>> getProvidersByService(
    String serviceId,
  ) async {
    final res = await _client
        .from(SupabaseTables.providers)
        .select()
        .eq('service_id', serviceId)
        .eq('is_approved', true);

    return res.map<ProviderModel>(ProviderModel.fromJson).toList();
  }

  Future<List<ProviderModel>> getPendingProviders() async {
    final res = await _client
        .from(SupabaseTables.providers)
        .select()
        .eq('is_approved', false);

    return res.map<ProviderModel>(ProviderModel.fromJson).toList();
  }

  Future<void> approveProvider(String providerId) async {
    await _client
        .from(SupabaseTables.providers)
        .update({'is_approved': true})
        .eq('id', providerId);
  }
}
