import 'package:hyperlocal_booking_app/features/auth/domain/repositories/auth_repository.dart';

class SendOtp {
  final AuthRepository repository;

  SendOtp(this.repository);

  Future<void> call(String email) {
    return repository.sendOtp(email);
  }
}
