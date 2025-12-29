import 'package:equatable/equatable.dart';
import '../../domain/entities/app_user.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class OtpSent extends AuthState {
  final String email;
  OtpSent(this.email);
}

class Authenticated extends AuthState {
  final AppUser user;
  Authenticated(this.user);
}


class AuthError extends AuthState {
  final String message;
  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
