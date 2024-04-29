import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'package:project/domain/entities/user_support.dart';

class SupportDataSource {
  final String apiKey = 'aBAPC7';

  Future<List<UserSupport>> getSupports() async {
    List<UserSupport> users = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/support")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await http.get(request);

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
      final response = await http.get(
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
    final response = await http.post(
      Uri.parse("https://retoolapi.dev/$apiKey/support"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userSupport.toJson()),
    );

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
      final response = await http.get(
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
}
