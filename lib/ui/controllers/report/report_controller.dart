import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/client_usecase.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/domain/use_case/us_usecase.dart';

class ReportController extends GetxController {
  RxList<String> clientsName = <String>[].obs;

  final ClientUseCase clientUseCase = Get.find();
  final SupportUseCase supportUseCase = Get.find();
  final ReportUseCase reportUseCase = Get.find();

  List<String> get clientsNameList => clientsName;

  late Report report;

  // Otros campos de estado
  String? selectedClient;
  int? selectedClientID;
  int? supportID;
  DateTime? selectedDate;
  TimeOfDay? selectedTimeStart;
  TimeOfDay? selectedTimeEnd;

  @override
  void onInit() {
    // getClientsName(); // do not run this code there because code will be crashed!!!!
    super.onInit();
  }

  Future<void> getClientsName() async {
    RxList<UserClient> clients = <UserClient>[].obs;
    clients.value = await clientUseCase.getClients();

    for (var client in clients) {
      clientsName.add(client.name);
    }

    clientsName;
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
    String clientName,
    String description,
    String supportEmail,
  ) async {
    RxList<UserClient> clients = <UserClient>[].obs;
    clients.value = await clientUseCase.getClients();

    int clientID = 0;
    for (var client in clients) {
      if (client.name == clientName) {
        clientID = client.id!;
      }
    }

    RxList<UserSupport> supports = <UserSupport>[].obs;
    supports.value = await supportUseCase.getSupports();

    int supportID = 0;
    for (var support in supports) {
      if (support.email == supportEmail) {
        supportID = support.id!;
      }
    }

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

  Future<void> getReportById(int id) async {
    RxList<Report> reports = <Report>[].obs;
    reports.value = await reportUseCase.getAllReports();

    late Report reportTemp;
    for (var report in reports) {
      if (report.id == id) {
        reportTemp = report;
      }
    }

    report = reportTemp;
  }

  Future<void> getClientNameOnReport(int id) async {
    RxList<UserClient> clients = <UserClient>[].obs;
    clients.value = await clientUseCase.getClients();

    late String name;
    for (var client in clients) {
      if (client.id == id) {
        name = client.name;
      }
    }

    selectedClient = name;
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
