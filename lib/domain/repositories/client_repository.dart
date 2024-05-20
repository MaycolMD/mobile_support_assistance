import 'package:project/data/datasources/remote/interfaces/I_client_datasource.dart';
import 'package:project/data/datasources/remote/client_datasource.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/repositories/interfaces/I_client_repository.dart';

class ClientRepository implements IClientRepository {
  final IClientDataSource _clientDataSource;
  String token = "";

  ClientRepository(this._clientDataSource);

  @override
  Future<List<UserClient>> getClients() async =>
      await _clientDataSource.getClients();

  @override
  Future<bool> addClient(UserClient client) async =>
      await _clientDataSource.addClient(client);

  @override
  Future<bool> updateClient(UserClient client) async =>
      await _clientDataSource.updateClient(client);

  @override
  Future<bool> deleteClient(int id) async =>
      await _clientDataSource.deleteClient(id);
}
