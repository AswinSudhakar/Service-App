// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../config/di/injection.dart';
// import '../core/network/supabase_client.dart';

// class AppInitializer {
//   static Future<void> init() async {
//     await Hive.initFlutter();
//     await SupabaseService.initialize();

//     Supabase.instance.client.auth.onAuthStateChange.listen((data) {
//   final event = data.event;
//   final session = data.session;

//   debugPrint('🔐 Auth event: $event');
//   debugPrint('👤 Session: $session');

//   if (event == AuthChangeEvent.signedIn && session != null) {
//     // ✅ User is fully logged in
//     // Navigate to home/dashboard
//   }

//   if (event == AuthChangeEvent.signedOut) {
//     // Handle logout
//   }
// });

//     // 🔍 TEMP DEBUG (REMOVE AFTER TEST)
//     final session = Supabase.instance.client.auth.currentSession;
//     debugPrint('Session after init: $session');
//     configureDependencies();
//   }
// }

import 'package:flutter/material.dart';
import 'package:hyperlocal_booking_app/core/network/supabase_client.dart';
import 'package:hyperlocal_booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hyperlocal_booking_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/di/injection.dart';

// class AppInitializer {
//   static Future<void> init() async {
//     WidgetsFlutterBinding.ensureInitialized();

//     configureDependencies();
//     await SupabaseService.initialize();

//     final auth = Supabase.instance.client.auth;

//     // ✅ 1. INITIAL SESSION CHECK (important)
//     final session = auth.currentSession;
//     getIt<AuthBloc>().add(
//       AuthSessionChangedEvent(session != null),
//     );

//     // ✅ 2. SINGLE AUTH STATE LISTENER
//     auth.onAuthStateChange.listen((data) {
//       final event = data.event;
//       final session = data.session;

//       debugPrint('🔐 Auth event: $event');
//       debugPrint('👤 Session: $session');

//       if (event == AuthChangeEvent.signedIn && session != null) {
//         getIt<AuthBloc>().add(AuthSessionChangedEvent(true));
//       }

//       if (event == AuthChangeEvent.signedOut) {
//         getIt<AuthBloc>().add(AuthSessionChangedEvent(false));
//       }
//     });
//   }
// }

class AppInitializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies();
    await SupabaseService.initialize();

    final auth = Supabase.instance.client.auth;

    // 1️⃣ INITIAL SESSION CHECK (cold start)
    final session = auth.currentSession;
    getIt<AuthBloc>().add(
      AuthSessionChangedEvent(session != null),
    );

    // 2️⃣ LISTEN FOR MAGIC LINK / LOGIN EVENTS
    auth.onAuthStateChange.listen((data) {
      final event = data.event;
      final session = data.session;

      debugPrint('🔐 Auth event: $event');
      debugPrint('👤 Session: $session');

      if (event == AuthChangeEvent.signedIn && session != null) {
        getIt<AuthBloc>().add(AuthSessionChangedEvent(true));
      }

      if (event == AuthChangeEvent.signedOut) {
        getIt<AuthBloc>().add(AuthSessionChangedEvent(false));
      }
    });
  }
}
