// import 'package:equatable/equatable.dart';

// abstract class AuthEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class AppStarted extends AuthEvent {}

// class SendOtpEvent extends AuthEvent {
//   final String email; // ✅ FIXED
//   SendOtpEvent(this.email);

//   @override
//   List<Object?> get props => [email];
// }

// class VerifyOtpEvent extends AuthEvent {
//   final String email;
//   final String token;

//   VerifyOtpEvent(this.email, this.token);

//   @override
//   List<Object?> get props => [email, token];
// }

// class LogoutEvent extends AuthEvent {}

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class SendMagicLinkEvent extends AuthEvent {
  final String email;
  SendMagicLinkEvent(this.email);
}

class AuthSessionChangedEvent extends AuthEvent {
  final bool isAuthenticated;
  AuthSessionChangedEvent(this.isAuthenticated);
}
