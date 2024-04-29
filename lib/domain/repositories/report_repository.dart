import 'package:project/data/datasources/remote/report_datasource.dart';
import 'package:project/domain/entities/report.dart';

class ReportRepository {
  late ReportDataSource _reportDataSource;
  String token = "";

  ReportRepository() {
    _reportDataSource = ReportDataSource();
  }

  Future<List<Report>> getReports(String clientID, String supportID) async =>
      await _reportDataSource.getReports(clientID, supportID);

  Future<bool> addReport(Report report) async =>
      await _reportDataSource.addReport(report);

  Future<bool> deleteReport(String id) async =>
      await _reportDataSource.deleteReport(id);

  Future<bool> updateReport(Report report) async =>
      await _reportDataSource.addReport(report);
}
