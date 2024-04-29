class UserSupport {
  UserSupport({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  int? id;
  String name;
  String email;
  String role;
  String password;

  factory UserSupport.fromJson(Map<String, dynamic> json) => UserSupport(
      id: json["id"],
      name: json["name"],
      email: json["username"],
      password: json["password"],
      role: json["type"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "email": email,
        "password": password,
      };
}
