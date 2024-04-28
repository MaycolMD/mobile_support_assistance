import 'package:project/data/datasources/remote/report_datasource.dart';
import 'package:project/domain/entities/report.dart';

class ReportRepository {
  late ReportDataSource _reportDataSource;
  String token = "";

  ReportRepository() {
    _reportDataSource = ReportDataSource();
  }

  Future<List<Report>> getReports() async =>
      await _reportDataSource.getReports();

  Future<bool> addReport(Report report) async =>
      await _reportDataSource.addReport(report);

  Future<List<Report>> getReportsCoordinator(
          String clientID, String supportID) async =>
      await _reportDataSource.getReportsCO(clientID, supportID);
}
