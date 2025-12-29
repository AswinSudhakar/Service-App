import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/di/injection.dart';
import '../core/network/supabase_client.dart';

class AppInitializer {
  static Future<void> init() async {
    await Hive.initFlutter();
    await SupabaseService.initialize();
    // 🔍 TEMP DEBUG (REMOVE AFTER TEST)
    final session = Supabase.instance.client.auth.currentSession;
    debugPrint('Session after init: $session');
    configureDependencies();
  }
}
