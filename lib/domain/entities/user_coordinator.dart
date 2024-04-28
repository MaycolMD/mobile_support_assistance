import 'dart:ffi';

class UserCoordinator {
  UserCoordinator(
      {this.id,
      required this.name,
      required this.email,
      required this.role,
      required this.enabled});

  int? id;
  String name;
  final String email;
  final String role;
  final Bool enabled;
}
