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

  Future<void> addReport(
    String date,
    int rating,
    String status,
    String endTime,
    String startTime,
    String clientName,
    String description,
    String supportName,
  ) async {
    Report report = Report(
      date: date,
      rating: rating,
      status: status,
      endTime: endTime,
      startTime: startTime,
      clientName: clientName,
      description: description,
      supportName: supportName,
    );
    await _repository.addReport(report);
  }

  Future<void> deleteReport(String id) async {
    await _repository.deleteReport(id);
  }

  Future<void> updateReport(
    int id,
    String date,
    int rating,
    String status,
    String endTime,
    String startTime,
    String clientName,
    String description,
    String supportName,
  ) async {
    Report report = Report(
      id: id,
      date: date,
      rating: rating,
      status: status,
      endTime: endTime,
      startTime: startTime,
      clientName: clientName,
      description: description,
      supportName: supportName,
    );
    await _repository.updateReport(report);
  }
}
