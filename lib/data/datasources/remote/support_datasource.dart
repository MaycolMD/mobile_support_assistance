import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/interfaces/I_support_datasource.dart';
import 'package:project/domain/entities/user_support.dart';

class SupportDataSource implements ISupportDataSource {
  final http.Client httpClient;
  final String apiKey = 'y0eXL7';
  SupportDataSource({http.Client? client})
      : httpClient = client ?? http.Client();

  @override
  Future<List<UserSupport>> getSupports() async {
    List<UserSupport> users;
    var request = Uri.parse("https://retoolapi.dev/$apiKey/support")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await httpClient.get(request);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //logInfo(response.body);
      final data = jsonDecode(response.body);

      users = List<UserSupport>.from(data.map((x) {
        UserSupport us = UserSupport.fromJson(x);
        return us;
      }));
      return Future.value(users);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  @override
  Future<bool> isGetSupport(String email, String password) async {
    try {
      final response = await httpClient.get(
        Uri.parse(
            "https://retoolapi.dev/$apiKey/support?email=$email&password=$password"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final r = jsonDecode(response.body);
        if (r is List && r.isEmpty) {
          return Future.value(false);
        }
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (e) {
      // Error desconocido
      logError("Error: $e");
      return Future.value(false);
    }
  }

  @override
  Future<UserSupport?> getSupportByName(String name) async {
    try {
      final response = await httpClient.get(
        Uri.parse("https://retoolapi.dev/$apiKey/support?name=$name"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        if (userData is List && userData.isNotEmpty) {
          // Si se encontró el usuario, devolver sus datos

          return UserSupport.fromJson(userData[
              0]); // Suponiendo que el servidor devuelve solo un usuario
        }
      }
    } catch (e) {
      print("Error: $e");
    }
    return null; // Devolver null si no se encontró el usuario o hubo un error
  }

  @override
  Future<UserSupport?> getSupportById(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse("https://retoolapi.dev/$apiKey/support?id=$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        if (userData is List && userData.isNotEmpty) {
          // Si se encontró el usuario, devolver sus datos

          return UserSupport.fromJson(userData[
              0]); // Suponiendo que el servidor devuelve solo un usuario
        }
      }
    } catch (e) {
      print("Error: $e");
    }
    return null; // Devolver null si no se encontró el usuario o hubo un error
  }

  @override
  Future<bool> addSupport(UserSupport userSupport) async {
    final response = await httpClient.post(
      Uri.parse("https://retoolapi.dev/$apiKey/support"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userSupport.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  @override
  Future<bool> checkEmailExists(String email) async {
    try {
      final response = await httpClient.get(
        Uri.parse("https://retoolapi.dev/$apiKey/support?email=$email"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body).isNotEmpty;
      } else {
        return Future.value(false);
      }
    } catch (e) {
      logError("Error checking email existence: $e");
      return Future.value(false);
    }
  }

  @override
  Future<bool> deleteSupport(int id) async {
    final response = await httpClient.delete(
      Uri.parse("https://retoolapi.dev/$apiKey/support/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // El usuario de soporte fue eliminado correctamente
      return Future.value(true);
    } else if (response.statusCode == 404) {
      // El usuario de soporte no fue encontrado
      logError("Support user with id $id not found");
      return Future.value(false);
    } else {
      // Ocurrió algún error
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateSupport(UserSupport userSupport) async {
    final response = await httpClient.put(
      Uri.parse("https://retoolapi.dev/$apiKey/support/${userSupport.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userSupport.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // El usuario de soporte fue actualizado correctamente
      return Future.value(true);
    } else if (response.statusCode == 404) {
      // El usuario de soporte no fue encontrado
      logError("Support user with id ${userSupport.id} not found");
      return Future.value(false);
    } else {
      // Ocurrió algún error
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }
}
