import '../../../../core/usecase/usecase.dart';
import '../../../auth/domain/repositories/auth_repository.dart';

class IsAdmin implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  IsAdmin(this.authRepository);

  @override
  Future<bool> call(NoParams params) async {
    final user = await authRepository.getCurrentUser();
    if (user == null) return false;

    return user.role == 'admin';
  }
}
