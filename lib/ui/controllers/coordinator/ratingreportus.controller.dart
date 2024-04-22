import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingReportUSController extends GetxController {
  final TextEditingController clientController = TextEditingController();
  final TextEditingController supportController = TextEditingController();

  RxString selectedClient = 'All Clients'.obs;
  RxString selectedSupport = 'All Supports'.obs;

  @override
  void onClose() {
    clientController.dispose();
    supportController.dispose();
    super.onClose();
  }

  void selectClient() {
    if (selectedClient.value == 'All Clients') {
      // Mostrar TextField para ingresar ID de cliente
      Get.dialog(
        AlertDialog(
          title: Text('Enter Client ID'),
          content: TextField(
            controller: clientController,
            decoration: InputDecoration(
              hintText: 'Enter Client ID',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                selectedClient.value = clientController.text.isNotEmpty
                    ? clientController.text
                    : 'All Clients';
                selectedSupport.value = 'All Supports';
                supportController.clear();
                clientController.clear();
                Get.back();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      );
    } else {
      selectedClient.value = 'All Clients';
    }
  }

  void selectSupport() {
    if (selectedSupport.value == 'All Supports') {
      // Mostrar TextField para ingresar ID de soporte
      Get.dialog(
        AlertDialog(
          title: Text('Enter Support ID'),
          content: TextField(
            controller: supportController,
            decoration: InputDecoration(
              hintText: 'Enter Support ID',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                selectedSupport.value = supportController.text.isNotEmpty
                    ? supportController.text
                    : 'All Supports';
                selectedClient.value = 'All Clients';
                clientController.clear();
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
  }

  void goToMainPage() {
    Get.toNamed('/MainPageUC');
  }
}
