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

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockReportRepository = MockIReportRepository();
    reportUseCase = ReportUseCase(mockReportRepository);
  });

  group('ReportUseCase', () {
    test('getAllReports should call getAllReports on the repository', () async {
      when(mockReportRepository.getAllReports())
          .thenAnswer((_) async => <Report>[]);

      // Act
      await reportUseCase.getAllReports();

      // Assert
      verify(mockReportRepository.getAllReports()).called(1);
    });

    test('addReport should call addReport method of repository', () async {
      // Arrange
      final Report report = Report(
          id: 100,
          date: DateTime.now().toString(),
          rating: 0,
          status: "Pendiente",
          endTime: TimeOfDay.now().toString(),
          startTime: TimeOfDay.now().toString(),
          clientID: 0,
          supportID: 0,
          description: "lorem ipsu");

      when(mockReportRepository.addReport(report)).thenAnswer((_) async =>
          true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      await reportUseCase.addReport(report);

      // Assert
      verify(mockReportRepository.addReport(report)).called(1);
    });

    test('getReports should call getReports method of repository', () async {
      final String clientID = '0';
      final String supportID = '0';
      when(mockReportRepository.getReports(clientID, supportID))
          .thenAnswer((_) async => <Report>[]);

      // Act
      await reportUseCase.getReports(clientID, supportID);

      // Assert
      verify(mockReportRepository.getReports(clientID, supportID));
    });

    test('updateReport should call updateReport method of repository',
        () async {
      // Arrange
      final Report report = Report(
          id: 100,
          date: DateTime.now().toString(),
          rating: 0,
          status: "Pendiente",
          endTime: TimeOfDay.now().toString(),
          startTime: TimeOfDay.now().toString(),
          clientID: 0,
          supportID: 0,
          description: "lorem ipsu");

      when(mockReportRepository.updateReport(report)).thenAnswer((_) async =>
          true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      await reportUseCase.updateReport(report);

      // Assert
      verify(mockReportRepository.updateReport(report)).called(1);
    });

    test('deleteReport should call deleteReport method of repository',
        () async {
      // Arrange
      final String idToDelete = '100';

      when(mockReportRepository.deleteReport(idToDelete)).thenAnswer(
          (_) async =>
              true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      await reportUseCase.deleteReport(idToDelete);

      // Assert
      verify(mockReportRepository.deleteReport(idToDelete)).called(1);
    });
  });
}
