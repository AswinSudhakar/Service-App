import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static late SupabaseClient client;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://wmjtucmtnoacgvjozrqn.supabase.co',
      anonKey: 'sb_publishable_nSf5ommlxmRogpzFsB8PxA_3t--_e62',
    );

    client = Supabase.instance.client;
  }
}
