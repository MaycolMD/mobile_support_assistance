import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/interfaces/I_report_datasource.dart';
import 'package:project/domain/entities/report.dart';

class ReportDataSource implements IReportDataSource {
  final http.Client httpClient;
  final String apiKey = 'g3jVP0';
//  final String apiKey = 'HFJEJb';

  ReportDataSource({http.Client? client})
      : httpClient = client ?? http.Client();

  @override
  Future<List<Report>> getAllReports() async {
    List<Report> reports = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/report")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));
    var response = await httpClient.get(request);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);

      reports = List<Report>.from(data.map((x) {
        Report r = Report.fromJson(x);
        return r;
      }));

      return Future.value(reports);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  @override
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

    var response = await httpClient.get(request);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);

      reports = List<Report>.from(data.map((x) {
        Report r = Report.fromJson(x);
        return r;
      }));
      return Future.value(reports);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  @override
  Future<bool> addReport(Report report) async {
    final response = await httpClient.post(
      Uri.parse("https://retoolapi.dev/$apiKey/report"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(report.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  @override
  Future<bool> deleteReport(String id) async {
    final response = await httpClient.delete(
      Uri.parse("https://retoolapi.dev/$apiKey/report/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // El reporte fue eliminado correctamente
      return Future.value(true);
    } else if (response.statusCode == 404) {
      // El reporte no fue encontrado
      logError("Report with id $id not found");
      return Future.value(false);
    } else {
      // Ocurrió algún error
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateReport(Report report) async {
    final response = await httpClient.put(
      Uri.parse("https://retoolapi.dev/$apiKey/report/${report.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(report.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      // El reporte fue actualizado correctamente
      return Future.value(true);
    } else if (response.statusCode == 404) {
      // El reporte no fue encontrado
      logError("Report with id ${report.id} not found");
      return Future.value(false);
    } else {
      // Ocurrió algún error
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }
}
