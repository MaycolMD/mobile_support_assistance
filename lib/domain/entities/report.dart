class Report {
  Report(
      {this.id,
      required this.date,
      required this.rating,
      required this.status,
      required this.endTime,
      required this.startTime,
      required this.clientID,
      required this.description,
      required this.supportID});

  int? id;
  String date;
  int rating;
  String status;
  String endTime;
  String startTime;
  int clientID;
  String description;
  int supportID;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
      id: json["id"],
      date: json["date"],
      rating: json["rating"],
      status: json["status"],
      endTime: json["endTime"],
      startTime: json["startTime"],
      clientID: json["clientID"],
      description: json["description"],
      supportID: json["supportID"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "rating": rating,
        "status": status,
        "endTime": endTime,
        "startTime": startTime,
        "clientID": clientID,
        "description": description,
        "supportID": supportID
      };
}
