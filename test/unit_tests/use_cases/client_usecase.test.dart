import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/use_case/client_usecase.dart';
import '../mocks/client_mocks/client_test.mocks.mocks.dart';

// Mock de ClientRepository
//class MockIClientRepository extends Mock implements ClientRepository {}

void main() {
  late MockIClientRepository mockClientRepository;
  late ClientUseCase clientUseCase;
  late UserClient newUser;

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockClientRepository = MockIClientRepository();
    clientUseCase = ClientUseCase(mockClientRepository);
    newUser = UserClient(id: 999999999, name: 'Tester Client');
  });

  test('getClients should call getClients on the repository', () async {
    when(mockClientRepository.getClients())
        .thenAnswer((_) async => <UserClient>[]);

    await clientUseCase.getClients();

    verify(mockClientRepository.getClients()).called(1);
  });

  test('getClientByName should call getClientByName method on the repository',
      () async {
    when(mockClientRepository.getClientByName(newUser.name))
        .thenAnswer((_) async => newUser);

    await clientUseCase.getClientByName(newUser.name);

    verify(mockClientRepository.getClientByName(newUser.name)).called(1);
  });

  test('addClient should call addClient method on the repository', () async {
    when(mockClientRepository.addClient(newUser)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    await clientUseCase.addClient(newUser);

    // Assert
    verify(mockClientRepository.addClient(newUser)).called(1);
  });

  test('updateClient should call updateClient method on the repository',
      () async {
    when(mockClientRepository.updateClient(newUser)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await clientUseCase.updateClient(newUser);

    // Assert
    verify(mockClientRepository.updateClient(newUser)).called(1);
  });

  test('deleteClient should call deleteClient method on the repository',
      () async {
    when(mockClientRepository.deleteClient(newUser.id)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await clientUseCase.deleteClient(newUser.id!);

    // Assert
    verify(mockClientRepository.deleteClient(newUser.id)).called(1);
  });
}
