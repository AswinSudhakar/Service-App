import 'package:supabase_flutter/supabase_flutter.dart';
import 'failure.dart';

Failure mapExceptionToFailure(Object error) {
  if (error is AuthException) {
    return ServerFailure(error.message);
  }

  if (error is PostgrestException) {
    return ServerFailure(error.message);
  }

  return ServerFailure(error.toString());
}
