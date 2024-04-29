import 'package:project/data/datasources/remote/client_datasource.dart';
import 'package:project/domain/entities/user_client.dart';

class ClientRepository {
  late ClientDataSource _clientDataSource;
  String token = "";

  ClientRepository() {
    _clientDataSource = ClientDataSource();
  }

  Future<List<String>> getClients() async =>
      await _clientDataSource.getClients();

  Future<bool> addClient(UserClient client) async =>
      await _clientDataSource.addClient(client);
  
  Future<bool> updateClient(UserClient client) async =>
      await _clientDataSource.updateClient(client);
  
  Future<bool> deleteClient(int id) async =>
      await _clientDataSource.deleteClient(id);
}
