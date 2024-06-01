import 'package:project/data/datasources/remote/interfaces/I_report_datasource.dart';
import 'package:project/data/datasources/remote/report_datasource.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/repositories/interfaces/I_report_repository.dart';

class ReportRepository implements IReportRepository {
  final IReportDataSource _reportDataSource;
  String token = "";

  ReportRepository(this._reportDataSource);
  @override
  Future<List<Report>> getAllReports() async =>
      await _reportDataSource.getAllReports();

  @override
  Future<List<Report>> getReports(String clientID, String supportID) async =>
      await _reportDataSource.getReports(clientID, supportID);

  @override
  Future<bool> addReport(Report report) async =>
      await _reportDataSource.addReport(report);

  @override
  Future<bool> deleteReport(String id) async =>
      await _reportDataSource.deleteReport(id);

  @override
  Future<bool> updateReport(Report report) async =>
      await _reportDataSource.updateReport(report);
}
