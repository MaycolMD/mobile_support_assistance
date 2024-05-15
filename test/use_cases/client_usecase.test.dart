import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/repositories/client_repository.dart';
import 'package:project/domain/use_case/client_usecase.dart';

// Mock de ClientRepository
class MockClientRepository extends Mock implements ClientRepository {}

void main() {
  group('ClientUseCase', () {
    late ClientUseCase clientUseCase;
    late MockClientRepository mockClientRepository;

    setUp(() {
      // Inicialización del mock y la instancia de ClientUseCase
      mockClientRepository = MockClientRepository();
      clientUseCase = ClientUseCase();

      // Reemplaza la instancia inyectada por Get con el mock
      Get.put<ClientRepository>(mockClientRepository);
    });

    test('getClients should return a list of user clients', () async {
      // Arrange
      final List<UserClient> mockUserClients = [
        UserClient(id: 2, name: 'Delphinia Kenafaque'),
        UserClient(id: 3, name: 'Katerine Jakubowsky'),
      ];
      when(mockClientRepository.getClients())
          .thenAnswer((_) async => mockUserClients);

      // Act
      final result = await clientUseCase.getClients();

      // Assert
      expect(result, equals(mockUserClients));
    });

    test('addClient should call addClient method of repository', () async {
      // Arrange
      final int id = 18;
      final String name = 'Maycol Moreno';
      final UserClient clientToAdd = UserClient(id: id, name: name);

      // Act
      await clientUseCase.addClient(id, name);

      // Assert
      verify(mockClientRepository.addClient(clientToAdd)).called(1);
    });

    test('deleteClient should call deleteClient method of repository',
        () async {
      // Arrange
      final int idToDelete = 5;

      // Act
      await clientUseCase.deleteClient(idToDelete);

      // Assert
      verify(mockClientRepository.deleteClient(idToDelete)).called(1);
    });

    test('updateClient should call updateClient method of repository',
        () async {
      // Arrange
      final int idToUpdate = 15;
      final String newName = 'Natalia Mendoza';
      final UserClient clientToUpdate =
          UserClient(id: idToUpdate, name: newName);

      // Act
      await clientUseCase.updateClient(idToUpdate, newName);

      // Assert
      verify(mockClientRepository.updateClient(clientToUpdate)).called(1);
    });
  });
}
