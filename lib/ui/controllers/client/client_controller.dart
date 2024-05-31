import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/use_case/client_usecase.dart';

class ClientController extends GetxController {
  RxList<String> clientsName = <String>[].obs;

  final ClientUseCase clientUseCase = Get.find();

  List<String> get clientsNameList => clientsName;

  String? selectedClient;

  Future<void> getClientsName() async {
    RxList<UserClient> clients = <UserClient>[].obs;
    clients.value = await clientUseCase.getClients();

    for (var client in clients) {
      clientsName.add(client.name);
    }

    clientsName;
  }
}
