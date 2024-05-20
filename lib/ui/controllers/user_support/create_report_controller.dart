import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/use_case/client_usecase.dart';
import 'package:project/domain/use_case/report_usecase.dart';

class CreateReportController extends GetxController {
  List<UserClient> _clients = <UserClient>[].obs;
  final ClientUseCase clientUseCase = Get.find();
  final ReportUseCase reportUseCase = Get.find();

  final TextEditingController descriptionController = TextEditingController();

  // Otros campos de estado
  String? selectedClient;
  List<UserClient> get clients => _clients;
  DateTime? selectedDate;
  TimeOfDay? selectedTimeStart;
  TimeOfDay? selectedTimeEnd;

  Future<List<UserClient>> getClients() async {
    logInfo("Getting clients from controller");
    _clients = await clientUseCase.getClients();
    return _clients;
  }

  Future<List<String>> getClientsName() async {
    List<String> names = <String>[].obs;
    _clients = await getClients();
    for (var element in _clients) {
      names.add(element.name);
    }
    return names;
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      update(); // Actualiza la interfaz de usuario
    }
    return pickedDate;
  }

  Future<TimeOfDay?> selectTime(
    BuildContext context,
    bool isStartTime,
  ) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? selectedTimeStart ?? TimeOfDay.now()
          : selectedTimeEnd ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      if (isStartTime) {
        selectedTimeStart = pickedTime;
      } else {
        selectedTimeEnd = pickedTime;
      }
      update(); // Actualiza la interfaz de usuario
    }
    return pickedTime;
  }

  addReport(
    String date,
    int rating,
    String status,
    String endTime,
    String startTime,
    int clientID,
    String description,
    int supportID,
  ) async {
    Report report = Report(
      date: date,
      rating: rating,
      status: status,
      endTime: endTime,
      startTime: startTime,
      clientID: clientID,
      description: description,
      supportID: supportID,
    );
    await reportUseCase.addReport(report);
  }

  getReports(String clientID, String supportID) async {
    await reportUseCase.getReports(clientID, supportID);
  }

  updateReport(
    int id,
    String date,
    int rating,
    String status,
    String endTime,
    String startTime,
    int clientID,
    String description,
    int supportID,
  ) async {
    Report report = Report(
      id: id,
      date: date,
      rating: rating,
      status: status,
      endTime: endTime,
      startTime: startTime,
      clientID: clientID,
      description: description,
      supportID: supportID,
    );
    await reportUseCase.updateReport(report);
  }

  deleteReport(String id) async {
    await reportUseCase.deleteReport(id);
  }
}
