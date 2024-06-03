import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:project/data/datasources/remote/client_datasource.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/repositories/client_repository.dart';

import '../mocks/client_mocks/client_test.mocks.mocks.dart';

void main() {
  late MockIClientDataSource mockIClientDataSource;
  late ClientRepository clientRepository;
  late UserClient client;

  setUp(() {
    mockIClientDataSource = MockIClientDataSource();
    clientRepository = ClientRepository(mockIClientDataSource);
    client = UserClient(id: 999999999, name: 'Tester Client');
  });

  test('getClients should call getClients on the datasource', () async {
    when(mockIClientDataSource.getClients())
        .thenAnswer((_) async => <UserClient>[]);

    await clientRepository.getClients();

    verify(mockIClientDataSource.getClients()).called(1);
  });

  test('getClientByName should call getClientByName method on the datasource',
      () async {
    when(mockIClientDataSource.getClientByName(client.name))
        .thenAnswer((_) async => client);

    await clientRepository.getClientByName(client.name);

    verify(mockIClientDataSource.getClientByName(client.name)).called(1);
  });

  test('addClient should call addClient method on the datasource', () async {
    when(mockIClientDataSource.addClient(client)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    bool result = await clientRepository.addClient(client);

    // Assert
    verify(mockIClientDataSource.addClient(client)).called(1);
    expect(result, isTrue);
  });

  test('updateClient should call updateClient method on the datasource',
      () async {
    when(mockIClientDataSource.updateClient(client)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await clientRepository.updateClient(client);

    // Assert
    verify(mockIClientDataSource.updateClient(client)).called(1);
    expect(result, isTrue);
  });

  test('deleteClient should call deleteClient method on the datasource',
      () async {
    when(mockIClientDataSource.deleteClient(client.id)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await clientRepository.deleteClient(client.id!);

    // Assert
    verify(mockIClientDataSource.deleteClient(client.id)).called(1);
    expect(result, isTrue);
  });
}
