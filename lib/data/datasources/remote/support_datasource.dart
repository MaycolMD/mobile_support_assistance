import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'package:project/domain/entities/user_support.dart';

class SupportDataSource {
  final http.Client httpClient;
  final String apiKey = 'aBAPC7';
  SupportDataSource({http.Client? client}) : httpClient = client ??  http.Client();

  Future<List<UserSupport>> getSupports() async {
    List<UserSupport> users = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/support")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await httpClient.get(request);

    if (response.statusCode == 200) {
      //logInfo(response.body);
      final data = jsonDecode(response.body);

      users = List<UserSupport>.from(data.map((x) {
        UserSupport us = UserSupport.fromJson(x);
        return us;
      }));
      print(users);
      return users;
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  Future<bool> isGetSupport(String email, String password) async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            "https://retoolapi.dev/$apiKey/support?email=$email&password=$password"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body).isNotEmpty;
      } else {
        return false;
      }
    } catch (e) {
      // Error desconocido
      logError("Error: $e");
      return false;
    }
  }

  Future<bool> addSupport(UserSupport userSupport) async {
    final response = await httpClient.post(
      Uri.parse("https://retoolapi.dev/$apiKey/support"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userSupport.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> checkEmailExists(String email) async {
    try {
      final response = await httpClient.get(
        Uri.parse("https://retoolapi.dev/$apiKey/support?email=$email"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body).isNotEmpty;
      } else {
        return false;
      }
    } catch (e) {
      logError("Error checking email existence: $e");
      return false;
    }
  }

  Future<bool> deleteSupport(int id) async {
  final response = await httpClient.delete(
    Uri.parse("https://retoolapi.dev/$apiKey/support/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // El usuario de soporte fue eliminado correctamente
    return true;
  } else if (response.statusCode == 404) {
    // El usuario de soporte no fue encontrado
    logError("Support user with id $id not found");
    return false;
  } else {
    // Ocurrió algún error
    logError("Got error code ${response.statusCode}");
    return false;
  }
}

Future<bool> updateSupport(UserSupport userSupport) async {
  final response = await httpClient.put(
    Uri.parse("https://retoolapi.dev/$apiKey/support/${userSupport.id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userSupport.toJson()),
  );

  if (response.statusCode == 200) {
    // El usuario de soporte fue actualizado correctamente
    return true;
  } else if (response.statusCode == 404) {
    // El usuario de soporte no fue encontrado
    logError("Support user with id ${userSupport.id} not found");
    return false;
  } else {
    // Ocurrió algún error
    logError("Got error code ${response.statusCode}");
    return false;
  }
}

}
