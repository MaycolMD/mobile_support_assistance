import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/report_datasource.dart';
import 'package:project/data/datasources/remote/support_datasource.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_support.dart';

void main() {
  late ReportDataSource
    datasource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late Report newReport; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    datasource = ReportDataSource(client: httpClient);
    newReport = Report(id: 100, date: "2024-10-10", rating: 2, status: "Approved", endTime: "10:00 pm", startTime: "08:00 am", clientID: 1, description: "loremp impsu", supportID: 3);
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });
  test('Create, Retrieve, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await datasource.addReport(newReport);
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<Report> reports = await datasource.getAllReports();
    // Using firstWhere with orElse to handle the case where no user is found
    Report? createdReport =
        reports.firstWhereOrNull((r) { print(r.id); return (r.id == newReport.id) ;});

    // // Check if the user was indeed found
    expect(createdReport, isNotNull);

    // // Step 3: Update the entry
    createdReport!.description =
        'Changing the description for test report'; // Safe because createdUser is not null here
    bool updateResult = await datasource.updateReport(createdReport);
    print('updateResult: $updateResult');
    expect(updateResult, isTrue);
    print('deleteUser: ${createdReport.id}');
    // Step 4: Delete the entry
    bool deleteResult = await datasource.deleteReport(createdReport.id!.toString()); // Assert non-null ID with '!'
    expect(deleteResult, isTrue);
  });
}
