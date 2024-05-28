import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/repositories/client_repository.dart';

class ClientUseCase {
  final ClientRepository _repository = Get.put(ClientRepository());
  ClientUseCase();

  Future<List<String>> getClients() async {
    logInfo("Getting clients from useCase");
    return await _repository.getClients();
  }

  Future<void> addClient(UserClient client) async {
    await _repository.addClient(client);
  }

  Future<void> deleteClient(int id) async {
    await _repository.deleteClient(id);
  }

  Future<void> updateClient(UserClient client) async {
    await _repository.updateClient(client);
  }
}
