class UserClient {
  UserClient({
    this.id,
    required this.name,
  });

  int? id;
  String name;

  factory UserClient.fromJson(Map<String, dynamic> json) =>
      UserClient(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
