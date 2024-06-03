import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/repositories/report_repository.dart';
import '../mocks/report_mocks/report_test.mocks.mocks.dart';

void main() {
  late MockIReportDataSource mockReportDataSource;
  late ReportRepository reportRepository;
  late Report report;

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockReportDataSource = MockIReportDataSource();
    reportRepository = ReportRepository(mockReportDataSource);
    report = Report(
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

  test('getAllReports should call getAllReports on the datsource', () async {
    when(mockReportDataSource.getAllReports())
        .thenAnswer((_) async => <Report>[]);

    // Act
    await reportRepository.getAllReports();

    // Assert
    verify(mockReportDataSource.getAllReports()).called(1);
  });

  test('getReports should call getReports on the datsource', () async {
    when(mockReportDataSource.getReports(
            report.clientID.toString(), report.supportID.toString()))
        .thenAnswer((_) async => <Report>[]);

    await reportRepository.getReports(
        report.clientID.toString(), report.supportID.toString());

    verify(mockReportDataSource.getReports(
            report.clientID.toString(), report.supportID.toString()))
        .called(1);
  });

  test('addReport should call addReport method on the datsource', () async {
    // Arrange

    when(mockReportDataSource.addReport(report)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await reportRepository.addReport(report);

    // Assert
    verify(mockReportDataSource.addReport(report)).called(1);
    expect(result, isTrue);
  });

  test('updateReport should call updateReport method on the datsource',
      () async {
    when(mockReportDataSource.updateReport(report)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await reportRepository.updateReport(report);

    // Assert
    verify(mockReportDataSource.updateReport(report)).called(1);
    expect(result, isTrue);
  });

  test('deleteReport should call deleteReport method on the datsource',
      () async {
    when(mockReportDataSource.deleteReport(report.id.toString())).thenAnswer(
        (_) async =>
            true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await reportRepository.deleteReport(report.id.toString());

    // Assert
    verify(mockReportDataSource.deleteReport(report.id.toString())).called(1);
    expect(result, isTrue);
  });
}
