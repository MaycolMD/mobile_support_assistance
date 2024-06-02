import 'package:hive/hive.dart';

part 'report_db.g.dart';

@HiveType(typeId: 0)
class ReportDB {
  @HiveField(0)
  int id;
  @HiveField(1)
  String date;
  @HiveField(2)
  int rating;
  @HiveField(3)
  String status;
  @HiveField(4)
  String endTime;
  @HiveField(5)
  String startTime;
  @HiveField(6)
  int clientID;
  @HiveField(7)
  String description;
  @HiveField(8)
  int supportID;

  ReportDB(
      {required this.id,
      required this.date,
      required this.rating,
      required this.status,
      required this.endTime,
      required this.startTime,
      required this.clientID,
      required this.description,
      required this.supportID});
}
