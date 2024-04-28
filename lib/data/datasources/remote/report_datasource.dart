import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'package:project/domain/entities/report.dart';

class ReportDataSource {
  final String apiKey = 'B3xFwU';
  Future<List<Report>> getReports() async {
    List<Report> reports = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/report")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await http.get(request);

    if (response.statusCode == 200) {
      //logInfo(response.body);
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

  Future<List<Report>> getReportsCO(String clientID, String supportID) async {
    List<Report> reports = [];
    var request = Uri.parse(
            "https://retoolapi.dev/$apiKey/report?clientName=$clientID&supportName=$supportID")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

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
}
