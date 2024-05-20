import 'package:project/domain/entities/report.dart';

abstract class IReportDataSource {
  Future<List<Report>> getAllReports();

  Future<List<Report>> getReports(String clientID, String supportID);

  Future<bool> addReport(Report report);

  Future<bool> updateReport(Report report);

  Future<bool> deleteReport(String id);
}
