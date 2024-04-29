import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/use_case/client_usecase.dart';

class FormControllers extends GetxController {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ClientUseCase _clientUseCase = Get.find();

  addClient(UserClient client) async {
    await _clientUseCase.addClient(client);
  }

  getClients() async {
    await _clientUseCase.getClients();
  }
  
  updateClient(UserClient client) async {
    await _clientUseCase.updateClient(client);
  }

  deleteClient(int id) async {
    await _clientUseCase.deleteClient(id);
  }
}
