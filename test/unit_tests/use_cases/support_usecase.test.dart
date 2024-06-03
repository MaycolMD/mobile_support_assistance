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
  late UserSupport support;

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockSupportRepository = MockISupportRepository();
    supportUseCase = SupportUseCase(mockSupportRepository);
    support = UserSupport(
        id: 999999999,
        name: 'Supporter',
        email: 'support@a.com',
        password: '1234567890',
        role: 'support');
  });

  test('addSupport should call addSupport method on the repository', () async {
    when(mockSupportRepository.addSupport(support)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await supportUseCase.addSupport(support);

    // Assert
    verify(mockSupportRepository.addSupport(support)).called(1);
    expect(result, isTrue);
  });

  test('getSupports should call getSupports on the repository', () async {
    when(mockSupportRepository.getSupports())
        .thenAnswer((_) async => <UserSupport>[]);

    // Act
    await supportUseCase.getSupports();

    // Assert
    verify(mockSupportRepository.getSupports()).called(1);
  });

  test('getSupportByName should call getSupportByName on the repository',
      () async {
    when(mockSupportRepository.getSupportByName(support.name))
        .thenAnswer((_) async => support);

    // Act
    await supportUseCase.getSupportByName(support.name);

    // Assert
    verify(mockSupportRepository.getSupportByName(support.name)).called(1);
  });

  test('getSupportById should call getSupportById on the repository', () async {
    when(mockSupportRepository.getSupportById(support.id))
        .thenAnswer((_) async => support);

    // Act
    await supportUseCase.getSupportById(support.id!);

    // Assert
    verify(mockSupportRepository.getSupportById(support.id)).called(1);
  });

  test('isGetSupport should call isGetSupport on the repository', () async {
    when(mockSupportRepository.isGetSupport(support.email, support.password))
        .thenAnswer((_) async => true);

    // Act
    bool result =
        await supportUseCase.isGetSupport(support.email, support.password);

    // Assert
    verify(mockSupportRepository.isGetSupport(support.email, support.password))
        .called(1);
    expect(result, isTrue);
  });

  test('checkEmailExists should call to checkEmailExists method of repository',
      () async {
    when(mockSupportRepository.checkEmailExists(support.email))
        .thenAnswer((_) async => true);

    bool result = await supportUseCase.checkEmailExists(support.email);

    verify(mockSupportRepository.checkEmailExists(support.email)).called(1);
    expect(result, isTrue);
  });

  test('updateSupport should call updateSupport method of repository',
      () async {
    when(mockSupportRepository.updateSupport(support)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await supportUseCase.updateSupport(support);

    // Assert
    verify(mockSupportRepository.updateSupport(support)).called(1);
    expect(result, isTrue);
  });

  test('deleteSupport should call deleteSupport method of repository',
      () async {
    when(mockSupportRepository.deleteSupport(support.id)).thenAnswer(
        (_) async =>
            true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await supportUseCase.deleteSupport(support.id!);

    // Assert
    verify(mockSupportRepository.deleteSupport(support.id)).called(1);
    expect(result, isTrue);
  });
}
