import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/use_case/client_usecase.dart';

class CreateReportController extends GetxController {
  List<String> _clients = <String>[].obs;
  final ClientUseCase clientUseCase = Get.put(ClientUseCase());
  final TextEditingController descriptionController = TextEditingController();

  // Otros campos de estado
  String? selectedClient;
  List<String> get clients => _clients;
  DateTime? selectedDate;
  TimeOfDay? selectedTimeStart;
  TimeOfDay? selectedTimeEnd;

  Future<List<String>> getClients() async {
    logInfo("Getting clients from controller");
    _clients = await clientUseCase.getClients();
    return _clients;
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
}
