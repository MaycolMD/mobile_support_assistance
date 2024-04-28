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
      print(user);

      return user;
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }
}
