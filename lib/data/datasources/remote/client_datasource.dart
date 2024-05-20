import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/interfaces/I_client_datasource.dart';
import 'package:project/domain/entities/user_client.dart';

class ClientDataSource implements IClientDataSource {
  final http.Client httpClient;
  final String apiKey = 'XzNd0U';

  ClientDataSource({http.Client? client})
      : httpClient = client ?? http.Client();

  @override
  Future<List<UserClient>> getClients() async {
    List<UserClient> users = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/client")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await httpClient.get(request);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      users = List<UserClient>.from(data.map((x) {
        UserClient user = UserClient.fromJson(x);
        return user;
      }));

      return Future.value(users);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  @override
  Future<bool> addClient(UserClient client) async {
    final response = await httpClient.post(
      Uri.parse("https://retoolapi.dev/$apiKey/client"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  @override
  Future<bool> deleteClient(int id) async {
    final response = await httpClient.delete(
      Uri.parse("https://retoolapi.dev/$apiKey/client/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Future.value(true);
    } else if (response.statusCode == 404) {
      logError("Client with id $id not found");
      return Future.value(false);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateClient(UserClient client) async {
    final response = await httpClient.put(
      Uri.parse("https://retoolapi.dev/$apiKey/client/${client.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 200) {
      return Future.value(true);
    } else if (response.statusCode == 404) {
      logError("Client with id ${client.id} not found");
      return Future.value(false);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }
}
