import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/use_case/client_usecase.dart';

class FormControllers extends GetxController {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ClientUseCase _clientUseCase = Get.find();

  addClient(int id, String name) async {
    UserClient client = UserClient(id: id, name: name);
    await _clientUseCase.addClient(client);
  }

  getClients() async {
    await _clientUseCase.getClients();
  }

  getClientByName(String name) async {
    UserClient? u = await _clientUseCase.getClientByName(name);
    return u;
  }

  updateClient(int id, String name) async {
    UserClient client = UserClient(id: id, name: name);
    await _clientUseCase.updateClient(client);
  }

  deleteClient(int id) async {
    await _clientUseCase.deleteClient(id);
  }
}
