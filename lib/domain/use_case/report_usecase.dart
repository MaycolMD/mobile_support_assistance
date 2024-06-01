import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/repositories/interfaces/I_report_repository.dart';

class ReportUseCase {
  final IReportRepository _repository;
  ReportUseCase(this._repository);

  Future<List<Report>> getAllReports() async {
    return await _repository.getAllReports();
  }

  Future<List<Report>> getReports(String clientID, String supportID) async {
    logInfo("Getting reports from useCase");
    return await _repository.getReports(clientID, supportID);
  }

  Future<void> addReport(Report report) async {
    await _repository.addReport(report);
  }

  Future<void> deleteReport(String id) async {
    await _repository.deleteReport(id);
  }

  Future<void> updateReport(Report report) async {
    print('holaaa usecase');
    await _repository.updateReport(report);
  }
}
