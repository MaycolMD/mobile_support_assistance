import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'package:project/domain/entities/report.dart';

class ReportDataSource {
  final String apiKey = '85lR9B';

  Future<List<Report>> getReports(String clientID, String supportID) async {
    List<Report> reports = [];
    var queryParams = {
      "format": 'json',
    };

    if (clientID.isNotEmpty) {
      queryParams['clientID'] = clientID;
    }

    if (supportID.isNotEmpty) {
      queryParams['supportID'] = supportID;
    }

    var request = Uri.parse("https://retoolapi.dev/$apiKey/report")
        .replace(queryParameters: queryParams);

    var response = await http.get(request);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      reports = List<Report>.from(data.map((x) {
        Report r = Report.fromJson(x);
        return r;
      }));
      return reports;
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  Future<bool> addReport(Report report) async {
    final response = await http.post(
      Uri.parse("https://retoolapi.dev/$apiKey/report"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(report.toJson()),
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> deleteReport(String id) async {
  final response = await http.delete(
    Uri.parse("https://retoolapi.dev/$apiKey/report/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 204) {
    // El reporte fue eliminado correctamente
    return true;
  } else if (response.statusCode == 404) {
    // El reporte no fue encontrado
    logError("Report with id $id not found");
    return false;
  } else {
    // Ocurrió algún error
    logError("Got error code ${response.statusCode}");
    return false;
  }
}

Future<bool> updateReport(Report report) async {
  final response = await http.put(
    Uri.parse("https://retoolapi.dev/$apiKey/report/${report.id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(report.toJson()),
  );

  if (response.statusCode == 200) {
    // El reporte fue actualizado correctamente
    return true;
  } else if (response.statusCode == 404) {
    // El reporte no fue encontrado
    logError("Report with id ${report.id} not found");
    return false;
  } else {
    // Ocurrió algún error
    logError("Got error code ${response.statusCode}");
    return false;
  }
}

}
