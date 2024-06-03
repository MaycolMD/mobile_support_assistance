import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/repositories/support_repository.dart';
import '../mocks/support_mocks/support_test.mocks.mocks.dart';

void main() {
  late MockISupportDataSource mockSupportDataSource;
  late SupportRepository supportRepository;
  late UserSupport support;

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockSupportDataSource = MockISupportDataSource();
    supportRepository = SupportRepository(mockSupportDataSource);
    support = UserSupport(
        id: 999999999,
        name: 'Supporter',
        email: 'support@a.com',
        password: '1234567890',
        role: 'support');
  });

  test('addSupport should call addSupport method on the datasource', () async {
    when(mockSupportDataSource.addSupport(support)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await supportRepository.addSupport(support);

    // Assert
    verify(mockSupportDataSource.addSupport(support)).called(1);
    expect(result, isTrue);
  });

  test('getSupports should call getSupports on the datasource', () async {
    when(mockSupportDataSource.getSupports())
        .thenAnswer((_) async => <UserSupport>[]);

    // Act
    await supportRepository.getSupports();

    // Assert
    verify(mockSupportDataSource.getSupports()).called(1);
  });

  test('getSupportByName should call getSupportByName on the datasource',
      () async {
    when(mockSupportDataSource.getSupportByName(support.name))
        .thenAnswer((_) async => support);

    // Act
    await supportRepository.getSupportByName(support.name);

    // Assert
    verify(mockSupportDataSource.getSupportByName(support.name)).called(1);
  });

  test('getSupportById should call getSupportById on the datasource', () async {
    when(mockSupportDataSource.getSupportById(support.id))
        .thenAnswer((_) async => support);

    // Act
    await supportRepository.getSupportById(support.id!);

    // Assert
    verify(mockSupportDataSource.getSupportById(support.id)).called(1);
  });

  test('isGetSupport should call isGetSupport on the datasource', () async {
    when(mockSupportDataSource.isGetSupport(support.email, support.password))
        .thenAnswer((_) async => true);

    // Act
    bool result =
        await supportRepository.isGetSupport(support.email, support.password);

    // Assert
    verify(mockSupportDataSource.isGetSupport(support.email, support.password))
        .called(1);
    expect(result, isTrue);
  });

  test(
      'checkEmailExists should call to checkEmailExists method on the datasource',
      () async {
    when(mockSupportDataSource.checkEmailExists(support.email))
        .thenAnswer((_) async => true);

    bool result = await supportRepository.checkEmailExists(support.email);

    verify(mockSupportDataSource.checkEmailExists(support.email)).called(1);
    expect(result, isTrue);
  });

  test('updateSupport should call updateSupport method on the datasource',
      () async {
    when(mockSupportDataSource.updateSupport(support)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await supportRepository.updateSupport(support);

    // Assert
    verify(mockSupportDataSource.updateSupport(support)).called(1);
    expect(result, isTrue);
  });

  test('deleteSupport should call deleteSupport method on the datasource',
      () async {
    when(mockSupportDataSource.deleteSupport(support.id)).thenAnswer(
        (_) async =>
            true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await supportRepository.deleteSupport(support.id!);

    // Assert
    verify(mockSupportDataSource.deleteSupport(support.id)).called(1);
    expect(result, isTrue);
  });
}
