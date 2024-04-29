import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/repositories/report_repository.dart';

class ReportUseCase {
  final ReportRepository _repository = Get.put(ReportRepository());
  ReportUseCase();

  Future<List<Report>> getReports(String clientID, String supportID) async {
    logInfo("Getting reports from useCase");
    return await _repository.getReports(clientID, supportID);
  }

  Future<void> addReport(Report report) async {
    await _repository.addReport(report);
  }
}
