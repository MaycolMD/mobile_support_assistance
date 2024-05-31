import 'package:project/data/datasources/remote/interfaces/I_client_datasource.dart';
import 'package:project/domain/entities/user_client.dart';

abstract class IClientRepository {
  final IClientDataSource _clientDatatasource;

  IClientRepository(this._clientDatatasource);

  Future<List<UserClient>> getClients();

  Future<UserClient?> getClientByName(String name);

  Future<bool> addClient(UserClient user);

  Future<bool> updateClient(UserClient user);

  Future<bool> deleteClient(int id);
}
