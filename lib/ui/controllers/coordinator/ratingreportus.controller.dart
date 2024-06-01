import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/ui/pages/coordinator/ratingreportus.dart';

class RatingReportUSController extends GetxController {
  final RxList<Report> _reports = <Report>[].obs;

  final ReportUseCase _reportUseCase = Get.find();

  final TextEditingController clientController = TextEditingController();
  final TextEditingController supportController = TextEditingController();

  final RxBool shouldRefresh = true.obs;

  List<Report> get reports => _reports;

  RxString selectedClient = 'All Clients'.obs;
  RxString selectedSupport = 'All Supports'.obs;

  @override
  void onClose() {
    getAllReports();
    clientController.dispose();
    supportController.dispose();
    super.onClose();
  }

  Future<void> getAllReports() async {
    _reports.value = await _reportUseCase.getAllReports();
  }

  void selectClient() {
    if (selectedClient.value == 'All Clients') {
      // Mostrar TextField para ingresar ID de cliente
      Get.dialog(
        AlertDialog(
          title: const Text('Enter Client ID'),
          content: TextField(
            controller: clientController,
            decoration: const InputDecoration(
              hintText: 'Enter Client ID',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                selectedClient.value = clientController.text.isNotEmpty
                    ? clientController.text
                    : 'All Clients';
                clientController.clear();
                Get.back();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      );
    } else {
      selectedClient.value = 'All Clients';
    }
    shouldRefresh.value = true;
  }

  void selectSupport() {
    if (selectedSupport.value == 'All Supports') {
      // Mostrar TextField para ingresar ID de soporte
      Get.dialog(
        AlertDialog(
          title: const Text('Enter Support ID'),
          content: TextField(
            controller: supportController,
            decoration: const InputDecoration(
              hintText: 'Enter Support ID',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                selectedSupport.value = supportController.text.isNotEmpty
                    ? supportController.text
                    : 'All Supports';
                supportController.clear();
                Get.back();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      );
    } else {
      selectedSupport.value = 'All Supports';
    }
    shouldRefresh.value = true;
  }

  void goToMainPage() {
    Get.offNamed('/MainPageUC');
  }
}
