import '../../../../core/network/supabase_client.dart';
import '../../../../core/network/supabase_tables.dart';
import '../models/service_category_model.dart';
import '../models/service_model.dart';

class ServiceRemoteDataSource {
  final _client = SupabaseService.client;

  Future<List<ServiceCategoryModel>> getCategories() async {
    final res = await _client
        .from(SupabaseTables.services)
        .select('category_id, category_name')
        .eq('is_active', true);

    final map = <String, String>{};
    for (final row in res) {
      map[row['category_id']] = row['category_name'];
    }

    return map.entries
        .map((e) => ServiceCategoryModel(id: e.key, name: e.value))
        .toList();
  }

  Future<List<ServiceModel>> getServicesByCategory(String categoryId) async {
    final res = await _client
        .from(SupabaseTables.services)
        .select()
        .eq('category_id', categoryId)
        .eq('is_active', true);

    return res.map<ServiceModel>(ServiceModel.fromJson).toList();
  }

  Future<ServiceModel> getServiceDetail(String serviceId) async {
    final res = await _client
        .from(SupabaseTables.services)
        .select()
        .eq('id', serviceId)
        .single();

    return ServiceModel.fromJson(res);
  }

  Future<void> updateServiceStatus(
    String serviceId,
    bool isActive,
  ) async {
    await _client
        .from(SupabaseTables.services)
        .update({'is_active': isActive}).eq('id', serviceId);
  }
}
