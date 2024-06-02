import 'package:project/domain/entities/report.dart';

abstract class IReportLocalDataSource {
  Future<void> addOfflineReport(Report report);

  Future<List<Report>> getCachedReports(String clientID, String supportID);

  Future<void> cacheReports(List<Report> reports);

  Future<List<Report>> getOfflineReports();

  Future<void> clearOfflineReports();
}
