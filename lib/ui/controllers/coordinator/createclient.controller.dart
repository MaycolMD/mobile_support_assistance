import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/use_case/client_usecase.dart';

class FormControllers extends GetxController {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ClientUseCase _clientUseCase = Get.find();

  addClient(int id, String name) async {
    await _clientUseCase.addClient(id, name);
  }

  getClients() async {
    await _clientUseCase.getClients();
  }
  
  updateClient(int id, String name) async {
    await _clientUseCase.updateClient(id, name);
  }

  deleteClient(int id) async {
    await _clientUseCase.deleteClient(id);
  }
}
