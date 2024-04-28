class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["Name"],
      email: json["username"],
      password: json["password"],
      role: json["type"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "username": email,
        "password": password,
        "type": role
      };
}
