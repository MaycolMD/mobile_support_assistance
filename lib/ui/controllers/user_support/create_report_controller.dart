import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReportController extends GetxController {
  // Controladores para los widgets que los requieran
  final TextEditingController descriptionController = TextEditingController();

  // Otros campos de estado
  String? selectedClient;
  List<String> clientList = ['Client1', 'Client2', 'ClientN'];
  DateTime? selectedDate;
  TimeOfDay? selectedTimeStart;
  TimeOfDay? selectedTimeEnd;

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
}
