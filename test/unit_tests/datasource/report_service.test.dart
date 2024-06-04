import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/report_datasource.dart';
import 'package:project/domain/entities/report.dart';

void main() {
  late ReportDataSource datasource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late Report newReport; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    datasource = ReportDataSource(client: httpClient);
    newReport = Report(
        id: 12345678,
        date: "2024-10-10",
        rating: 2,
        status: "Approved",
        endTime: "10:00 pm",
        startTime: "08:00 am",
        clientID: 99999,
        description: "loremp impsu",
        supportID: 111111111);
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });
  test('Create, Get all reports, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await datasource.addReport(newReport);
    print('createResult value is: $createResult');
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<Report> reports = await datasource.getAllReports();
    // Using firstWhere with orElse to handle the case where no user is found
    Report? createdReport = reports.firstWhereOrNull((r) {
      return (r.id == newReport.id);
    });

    // // Check if the user was indeed found
    print('createdReport.id value is: ${createdReport!.id}');
    expect(createdReport, isNotNull);

    // // Step 3: Update the entry
    createdReport.description = 'Changing the description for test report';
    bool updateResult = await datasource.updateReport(createdReport);
    print('updateResult value is: $updateResult');
    expect(updateResult, isTrue);

    // Step 4: Delete the entry
    bool deleteResult = await datasource.deleteReport(
        createdReport.id.toString()); // Assert non-null ID with '!'
    print('deleteResult value is $deleteResult');
    expect(deleteResult, isTrue);
  });

  test('Create, Get report, and delete an entry', () async {
    bool createResult = await datasource.addReport(newReport);
    print('createResult value is: $createResult');
    expect(createResult, isTrue);

    List<Report> reports = await datasource.getReports(
        newReport.clientID.toString(), newReport.supportID.toString());
    print('reports.length value is ${reports.length}');
    expect(reports.length, equals(1));

    bool deleteResult = await datasource.deleteReport(newReport.id.toString());
    print('deleteResult value is $deleteResult');
    expect(deleteResult, isTrue);
  });
}
