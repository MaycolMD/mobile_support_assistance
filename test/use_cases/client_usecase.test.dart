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

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockClientRepository = MockIClientRepository();
    clientUseCase = ClientUseCase(mockClientRepository);
  });

  group('ClientUseCase', () {
    test('getClients should call getClients on the repository', () async {
      when(mockClientRepository.getClients())
          .thenAnswer((_) async => <UserClient>[]);

      // Act
      await clientUseCase.getClients();

      // Assert
      verify(mockClientRepository.getClients()).called(1);
    });

    test('addClient should call addClient method of repository', () async {
      // Arrange
      final int id = 19;
      final String name = 'Rigoberto Martinez';
      final UserClient clientToAdd = UserClient(id: id, name: name);

      when(mockClientRepository.addClient(clientToAdd)).thenAnswer((_) async =>
          true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      await clientUseCase.addClient(clientToAdd);

      // Assert
      verify(mockClientRepository.addClient(clientToAdd)).called(1);
    });

    test('updateClient should call updateClient method of repository',
        () async {
      // Arrange
      final int idToUpdate = 19;
      final String newName = 'Rigoberto Martinez';
      final UserClient clientToUpdate =
          UserClient(id: idToUpdate, name: newName);

      when(mockClientRepository.updateClient(clientToUpdate)).thenAnswer(
          (_) async =>
              true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      await clientUseCase.updateClient(clientToUpdate);

      // Assert
      verify(mockClientRepository.updateClient(clientToUpdate)).called(1);
    });

    test('deleteClient should call deleteClient method of repository',
        () async {
      // Arrange
      final int idToDelete = 19;

      when(mockClientRepository.deleteClient(idToDelete)).thenAnswer(
          (_) async =>
              true); // Asegura que el método mockeado devuelva un Future<bool>

      // Act
      await clientUseCase.deleteClient(idToDelete);

      // Assert
      verify(mockClientRepository.deleteClient(idToDelete)).called(1);
    });
  });
}
