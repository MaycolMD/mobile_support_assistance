import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project/data/models/report_db.dart';

class ReportControllerOffline extends GetxController {
  // Otros campos de estado
  String? selectedClient;
  int? selectedClientID;
  int? supportID;
  DateTime? selectedDate;
  TimeOfDay? selectedTimeStart;
  TimeOfDay? selectedTimeEnd;

  final _reportBox = Hive.box<ReportDB>('reports');

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
      String clientName,
      String description,
      String supportEmail,
      int clientID,
      int supportID) async {
    ReportDB report = ReportDB(
      date: date,
      rating: rating,
      status: status,
      endTime: endTime,
      startTime: startTime,
      clientID: clientID,
      description: description,
      supportID: supportID,
    );

    print('llega parte 2');

    await _reportBox.add(report);

    print('llega parte 3');
  }
}
