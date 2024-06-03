import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import '../mocks/report_mocks/report_test.mocks.mocks.dart';

// Mock de ClientRepository
//class MockIClientRepository extends Mock implements ClientRepository {}

void main() {
  late MockIReportRepository mockReportRepository;
  late ReportUseCase reportUseCase;
  late Report report;

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockReportRepository = MockIReportRepository();
    reportUseCase = ReportUseCase(mockReportRepository);
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

  test('getAllReports should call getAllReports on the repository', () async {
    when(mockReportRepository.getAllReports())
        .thenAnswer((_) async => <Report>[]);

    // Act
    await reportUseCase.getAllReports();

    // Assert
    verify(mockReportRepository.getAllReports()).called(1);
  });

  test('getReports should call getReports on the repository', () async {
    when(mockReportRepository.getReports(
            report.clientID.toString(), report.supportID.toString()))
        .thenAnswer((_) async => <Report>[]);

    await reportUseCase.getReports(
        report.clientID.toString(), report.supportID.toString());

    verify(mockReportRepository.getReports(
            report.clientID.toString(), report.supportID.toString()))
        .called(1);
  });

  test('addReport should call addReport method on the repository', () async {
    // Arrange

    when(mockReportRepository.addReport(report)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await reportUseCase.addReport(report);

    // Assert
    verify(mockReportRepository.addReport(report)).called(1);
  });

  test('updateReport should call updateReport method on the repository',
      () async {
    when(mockReportRepository.updateReport(report)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await reportUseCase.updateReport(report);

    // Assert
    verify(mockReportRepository.updateReport(report)).called(1);
  });

  test('deleteReport should call deleteReport method on the repository',
      () async {
    when(mockReportRepository.deleteReport(report.id.toString())).thenAnswer(
        (_) async =>
            true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await reportUseCase.deleteReport(report.id.toString());

    // Assert
    verify(mockReportRepository.deleteReport(report.id.toString())).called(1);
  });
}
