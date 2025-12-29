import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/app_user.dart';

class AuthRemoteDataSource {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> sendOtp(String email) async {
    debugPrint('🚀 [AUTH] About to call signInWithOtp');
    debugPrint('➡️  Email: $email');
    debugPrint('➡️  Base URL: ${_client.rest.url}');

    try {
      await _client.auth.signInWithOtp(email: email);
      debugPrint('✅ [AUTH] signInWithOtp completed WITHOUT exception');
    } catch (e, st) {
      debugPrint('❌ [AUTH] signInWithOtp FAILED');
      debugPrint('Error: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  Future<AppUser> verifyOtp({
    required String email,
    required String token,
  }) async {
    final res = await _client.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.email,
    );

    final user = res.user;
    if (user == null) {
      throw Exception('Invalid OTP');
    }

    return AppUser(
      id: user.id,
      email: user.email!,
      role: 'user',
    );
  }

  Future<AppUser?> currentUser() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    return AppUser(
      id: user.id,
      email: user.email!,
      role: 'user',
    );
  }

  Future<void> logout() async {
    await _client.auth.signOut();
  }
}
