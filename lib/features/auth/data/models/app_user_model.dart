import '../../domain/entities/app_user.dart';

class AppUserModel extends AppUser {
  const AppUserModel({
    required super.id,
    required super.email,
    required super.role,
  });

  factory AppUserModel.fromSupabase({
    required Map<String, dynamic> authUser,
    required Map<String, dynamic>? userRow,
  }) {
    return AppUserModel(
      id: authUser['id'],
      email: authUser['email'],
      role: userRow?['role'] ?? 'user',
    );
  }
}
