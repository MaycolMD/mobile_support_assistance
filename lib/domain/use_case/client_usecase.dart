import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/repositories/repository.dart';

class ClientUseCase {
  final Repository _repository = Get.put(Repository());
  ClientUseCase();

  Future<List<String>> getClients() async {
    logInfo("Getting clients from useCase");
    return await _repository.getClients();
  }
}
