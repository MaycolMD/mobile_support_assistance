import 'package:project/data/datasources/client_datasource.dart';
import 'package:project/domain/entities/user_client.dart';

class Repository {
  late ClientDataSource _clientDataSource;
  String token = "";

  Repository() {
    _clientDataSource = ClientDataSource();
  }

  Future<List<String>> getClients() async =>
      await _clientDataSource.getClients();
}
