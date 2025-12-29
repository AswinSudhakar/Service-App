import '../entities/app_user.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String email);
  Future<AppUser> verifyOtp({
    required String email,
    required String token,
  });
Future<AppUser?> getCurrentUser();
  Future<void> logout();
}
