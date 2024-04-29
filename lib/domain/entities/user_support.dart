class UserSupport {
  UserSupport({
    this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.password,
  });

  int? id;
  String name;
  String role;
  String email;
  String password;

  factory UserSupport.fromJson(Map<String, dynamic> json) => UserSupport(
      id: json["id"],
      name: json["name"],
      role: json["role"],
      email: json["email"],
      password: json["password"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "email": email,
        "password": password,
      };
}
