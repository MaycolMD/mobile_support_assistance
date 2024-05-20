import 'package:project/domain/entities/user_client.dart';

abstract class IClientDataSource {
  Future<List<UserClient>> getClients();

  Future<bool> addClient(UserClient user);

  Future<bool> updateClient(UserClient user);

  Future<bool> deleteClient(int id);
}
