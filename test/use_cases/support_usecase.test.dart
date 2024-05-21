import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/us_usecase.dart';
import '../mocks/support_mocks/support_test.mocks.mocks.dart';

// Mock de ClientRepository
//class MockIClientRepository extends Mock implements ClientRepository {}

void main() {
  late MockISupportRepository mockSupportRepository;
  late SupportUseCase supportUseCase;

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockSupportRepository = MockISupportRepository();
    supportUseCase = SupportUseCase(mockSupportRepository);
  });

  group('supportUseCase', () {
    test('getSupports should call getSupports on the repository', () async {
      when(mockSupportRepository.getSupports())
          .thenAnswer((_) async => <UserSupport>[]);

      // Act
      await supportUseCase.getSupports();

      // Assert
      verify(mockSupportRepository.getSupports()).called(1);
    });

    test('addSupportUser should call addSupportUser method of repository',
        () async {
      // Arrange
      UserSupport userSupport = UserSupport(
        id: 100,
        name: 'Rolando Mckolled',
        email: 'email@gmail.com',
        password: 'unacontrasena',
        role: 'support',
      );

      when(mockSupportRepository.addSupport(userSupport)).thenAnswer(
          (_) async =>
              true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      bool result = await supportUseCase.addSupport(userSupport);

      // Assert
      verify(mockSupportRepository.addSupport(userSupport)).called(1);
      expect(result, isTrue);
    });

    test('isGetSupport should call to isGetSupport method of repository',
        () async {
      final String email = 'email@gmail.com';
      final String password = 'unacontrasena';
      when(mockSupportRepository.isGetSupport(email, password))
          .thenAnswer((_) async => true);

      // Act
      bool result = await supportUseCase.isGetSupport(email, password);

      // Assert
      verify(mockSupportRepository.isGetSupport(email, password));
      expect(result, isTrue);
    });

    test(
        'checkEmailExists should call to checkEmailExists method of repository',
        () async {
      final String email = 'email@gmail.com';
      when(mockSupportRepository.checkEmailExists(email))
          .thenAnswer((_) async => true);

      bool result = await supportUseCase.checkEmailExists(email);

      verify(mockSupportRepository.checkEmailExists(email)).called(1);
      expect(result, isTrue);
    });

    test('updateSupport should call updateSupport method of repository',
        () async {
      // Arrange
      UserSupport userSupport = UserSupport(
        id: 100,
        name: 'Rolando Mckolled',
        email: 'email@gmail.com',
        password: 'unacontrasena',
        role: 'support',
      );

      when(mockSupportRepository.updateSupport(userSupport)).thenAnswer(
          (_) async =>
              true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      bool result = await supportUseCase.updateSupport(userSupport);

      // Assert
      verify(mockSupportRepository.updateSupport(userSupport)).called(1);
      expect(result, isTrue);
    });

    test('deleteSupport should call deleteSupport method of repository',
        () async {
      // Arrange
      final int idToDelete = 100;

      when(mockSupportRepository.deleteSupport(idToDelete)).thenAnswer(
          (_) async =>
              true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      bool result = await supportUseCase.deleteSupport(idToDelete);

      // Assert
      verify(mockSupportRepository.deleteSupport(idToDelete)).called(1);
      expect(result, isTrue);
    });
  });
}
