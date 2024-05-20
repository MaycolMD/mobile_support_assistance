import 'package:project/data/datasources/remote/interfaces/I_report_datasource.dart';
import 'package:project/domain/entities/report.dart';

abstract class IReportRepository {
  final IReportDataSource _reportDataSource;

  IReportRepository(this._reportDataSource);

  Future<List<Report>> getAllReports();

  Future<List<Report>> getReports(String clientID, String supportID);

  Future<bool> addReport(Report report);

  Future<bool> updateReport(Report report);

  Future<bool> deleteReport(String id);
}
