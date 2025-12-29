import '../../../../core/error/error_mapper.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<void> sendOtp(String email) async {
    try {
      await remote.sendOtp(email);
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<AppUser> verifyOtp({
    required String email,
    required String token,
  }) async {
    try {
      return await remote.verifyOtp(
        email: email,
        token: token,
      );
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<AppUser?> getCurrentUser() {
    return remote.currentUser();
  }

  @override
  Future<void> logout() {
    return remote.logout();
  }
}
