import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'package:project/domain/entities/user_client.dart';

class ClientDataSource {
  final String apiKey = 'XzNd0U';
  Future<List<String>> getClients() async {
    var request = Uri.parse("https://retoolapi.dev/$apiKey/client")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await http.get(request);

    if (response.statusCode == 200) {
      //logInfo(response.body);
      final data = jsonDecode(response.body);

      List<String> user = List<String>.from(data.map((x) {
        UserClient user = UserClient.fromJson(x);
        return user.name;
      }));

      return user;
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  Future<bool> addClient(UserClient client) async {
    final response = await http.post(
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

  Future<bool> deleteClient(int id) async {
  final response = await http.delete(
    Uri.parse("https://retoolapi.dev/$apiKey/client/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 204) {
    return true;
  } else if (response.statusCode == 404) {
    logError("Client with id $id not found");
    return false;
  } else {
    logError("Got error code ${response.statusCode}");
    return false;
  }
}

Future<bool> updateClient(UserClient client) async {
  final response = await http.put(
    Uri.parse("https://retoolapi.dev/$apiKey/client/${client.id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(client.toJson()),
  );

  if (response.statusCode == 200) {
    return true;
  } else if (response.statusCode == 404) {
    logError("Client with id ${client.id} not found");
    return false;
  } else {
    logError("Got error code ${response.statusCode}");
    return false;
  }
}

}
