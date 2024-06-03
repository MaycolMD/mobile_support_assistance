import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';
import 'package:project/data/core/network_info.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/client_usecase.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/domain/use_case/us_usecase.dart';

import '../../../data/models/report_db.dart';

class ReportController extends GetxController {
  final RxList<Report> _reports = <Report>[].obs;

  final ClientUseCase clientUseCase = Get.find();
  final SupportUseCase supportUseCase = Get.find();
  final ReportUseCase reportUseCase = Get.find();

  final NetworkInfo networkInfo = Get.find();

  final _reportBox = Hive.box<ReportDB>('reports');

  List<Report> get reports => _reports;

  late Report report;
  late int numberOfReports;

  // Otros campos de estado
  String? selectedClient;
  int? selectedClientID;
  int? supportID;
  DateTime? selectedDate;
  TimeOfDay? selectedTimeStart;
  TimeOfDay? selectedTimeEnd;

  @override
  void onInit() {
    super.onInit();
    _syncReports();
  }

  void _syncReports() async {
    if (await networkInfo.isConnected()) {
      // Obtener los reportes locales guardados en Hive
      final reports = _reportBox.values.toList();
      print('reports offline');
      print(reports);
      // Sincronizar con el servidor
      await _syncWithServer(reports);
      // Eliminar los reportes locales después de sincronizar con éxito
      _reportBox.deleteAll(_reportBox.keys);
      _reportBox.clear();
    }
  }

  Future<void> _syncWithServer(List<ReportDB> reports) async {
    // Lógica para sincronizar con el servidor
    for (var element in reports) {
      print(element);
      await addReportHive(
          element.date,
          element.rating,
          element.status,
          element.endTime,
          element.startTime,
          element.clientID,
          element.description,
          element.supportID);
    }
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

  addReportHive(
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

  Future<void> getAllReports() async {
    _reports.value = await reportUseCase.getAllReports();
  }

  Future<void> getReports(String clientID, String supportID) async {
    _reports.value = await reportUseCase.getReports(clientID, supportID);
  }

  Future<int> getNumberOfReportsBySupportID(int supportID) async {
    await getReports('', supportID.toString());
    int value = _reports.length;

    _reports.clear();
    return value;
  }

  Future<int> getAvgRating(int supportID) async {
    await getReports('', supportID.toString());
    if (_reports.isEmpty) return 0;

    int valueTemp = 0;
    for (var report in _reports) {
      valueTemp += report.rating;
    }

    double avg = valueTemp / _reports.length;
    _reports.clear();
    return avg.toInt().isNaN ? 0 : avg.toInt(); // Manejo de NaN
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
    int? id,
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
    print(report.id);
    print(report.status);
    await reportUseCase.updateReport(report);
  }

  deleteReport(String id) async {
    await reportUseCase.deleteReport(id);
  }
}
