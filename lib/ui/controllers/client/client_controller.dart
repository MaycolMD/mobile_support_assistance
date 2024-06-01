import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/use_case/client_usecase.dart';

class ClientController extends GetxController {
  RxList<String> clientsName = <String>[].obs;

  final ClientUseCase _clientUseCase = Get.find();

  List<String> get clientsNameList => clientsName;

  final TextEditingController clientController = TextEditingController();
  String? selectedClient;
  RxString selectedClientFilter = 'All Clients'.obs;
  final RxBool shouldRefresh = true.obs;

  @override
  void onInit() {
    getClients();
    super.onInit();
  }

  Future<void> getClientsName() async {
    RxList<UserClient> clients = <UserClient>[].obs;
    clients.value = await _clientUseCase.getClients();

    for (var client in clients) {
      clientsName.add(client.name);
    }

    clientsName;
  }

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

  Future<void> selectClient() async {
    if (selectedClientFilter.value == 'All Clients') {
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
                selectedClientFilter.value = clientController.text.isNotEmpty
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
      selectedClientFilter.value = 'All Clients';
    }
    shouldRefresh.value = true;
  }
}
