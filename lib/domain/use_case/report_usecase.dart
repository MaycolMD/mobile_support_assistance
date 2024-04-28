import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/repositories/report_repository.dart';

class ReportUseCase {
  final ReportRepository _repository = Get.put(ReportRepository());
  ReportUseCase();

  Future<List<Report>> getReports() async {
    logInfo("Getting clients from useCase");
    return await _repository.getReports();
  }

  Future<void> addReport(Report report) async {
    await _repository.addReport(report);
  }

  Future<List<Report>> getReportsCO(String clientID, String supportID) async {
    logInfo("Getting clients from coordinator");
    return await _repository.getReportsCoordinator(clientID, supportID);
  }
}
