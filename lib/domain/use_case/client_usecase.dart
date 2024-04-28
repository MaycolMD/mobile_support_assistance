import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/repositories/repository_client.dart';

class ClientUseCase {
  final Repository _repository = Get.put(Repository());
  ClientUseCase();

  Future<List<String>> getClients() async {
    logInfo("Getting clients from useCase");
    return await _repository.getClients();
  }

  Future<void> addClient(UserClient client) async {
    await _repository.addClient(client);
  }
}
