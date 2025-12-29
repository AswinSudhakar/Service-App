// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hyperlocal_booking_app/core/network/supabase_client.dart';
// import '../../domain/usecases/send_otp.dart';
// import '../../domain/usecases/verify_otp.dart';
// import 'auth_event.dart';
// import 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final SendOtp sendOtp;
//   final VerifyOtp verifyOtp;

//   AuthBloc({
//     required this.sendOtp,
//     required this.verifyOtp,
//   }) : super(AuthInitial()) {
//     on<AppStarted>((_, emit) {
//       emit(AuthInitial());
//     });

//     on<SendOtpEvent>((event, emit) async {
//       emit(AuthLoading());
//       try {
//         await sendOtp(event.email); // ✅ FIXED
//         emit(OtpSent(event.email)); // pass email forward
//       } catch (e) {
//         emit(AuthError(e.toString()));
//       }
//     });

//     on<VerifyOtpEvent>((event, emit) async {
//       emit(AuthLoading());
//       try {
//         final user = await verifyOtp(
//           email: event.email,
//           otp: event.token,
//         );

//         await SupabaseService.client.from('users').upsert({
//           'id': user.id,
//           'email': user.email,
//           'role': 'user',
//         });

//         emit(Authenticated(user));
//       } catch (e) {
//         emit(AuthError(e.toString()));
//       }
//     });
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBlocState> {
  AuthBloc() : super(AuthInitial()) {
    on<SendMagicLinkEvent>(_sendMagicLink);
    on<AuthSessionChangedEvent>(_onSessionChanged);
  }

  Future<void> _sendMagicLink(
    SendMagicLinkEvent event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await Supabase.instance.client.auth.signInWithOtp(
        email: event.email,
      );
      emit(MagicLinkSent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onSessionChanged(
    AuthSessionChangedEvent event,
    Emitter<AuthBlocState> emit,
  ) {
    if (event.isAuthenticated) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
