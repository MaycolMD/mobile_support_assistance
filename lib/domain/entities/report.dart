class Report {
  Report(
      {this.id,
      required this.date,
      required this.rating,
      required this.status,
      required this.endTime,
      required this.startTime,
      required this.clientName,
      required this.description,
      required this.supportName});

  int? id;
  String date;
  int rating;
  String status;
  String endTime;
  String startTime;
  String clientName;
  String description;
  String supportName;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
      id: json["id"],
      date: json["date"],
      rating: json["rating"],
      status: json["status"],
      endTime: json["endTime"],
      startTime: json["startTime"],
      clientName: json["clientName"],
      description: json["description"],
      supportName: json["supportName"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "rating": rating,
        "status": status,
        "endTime": endTime,
        "startTime": startTime,
        "clientName": clientName,
        "description": description,
        "supportName": supportName
      };
}
