class AppUser {
  final String id;
  final String email;
  final String role; // user | admin

  const AppUser({
    required this.id,
    required this.email,
    required this.role,
  });
}
