import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/use_case/client_usecase.dart';

class FormControllers extends GetxController {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ClientUseCase _clientUseCase = Get.put(ClientUseCase());

  addClient(UserClient client) async {
    await _clientUseCase.addClient(client);
  }
}
