import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/client_datasource.dart';
import 'package:project/domain/entities/user_client.dart';

void main() {
  late ClientDataSource
      clientDataSource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late UserClient newUser; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    clientDataSource = ClientDataSource(client: httpClient);
    newUser = UserClient(id: 999999999, name: 'Tester Client');
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });

  test('Create, Get by a name and Delete an entry', () async {
    bool createResult = await clientDataSource.addClient(newUser);
    print("createResult value is $createResult");
    expect(createResult, isTrue);

    UserClient? user = await clientDataSource.getClientByName(newUser.name);
    print("user.name is ${user!.name}");
    expect(user, isNotNull);

    bool deleteResult = await clientDataSource
        .deleteClient(user.id!); // Assert non-null ID with '!'
    print("deleteResult value is $deleteResult");
    expect(deleteResult, isTrue);
  });

  test('Create, Get clients , Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await clientDataSource.addClient(newUser);
    print("createResult value is $createResult");
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<UserClient> users = await clientDataSource.getClients();
    // Using firstWhere with orNull to handle the case where no user is found
    UserClient? createdUser = users.firstWhereOrNull((user) {
      return (user.id == newUser.id);
    });
    print("createdUser.id value is ${createdUser!.id}");
    expect(createdUser, isNotNull);

    // // Step 3: Update the entry
    createdUser.name =
        'Client for test'; // Safe because createdUser is not null here
    bool updateResult = await clientDataSource.updateClient(createdUser);
    print('updateResult value is $updateResult');
    expect(updateResult, isTrue);

    // Step 4: Delete the entry
    bool deleteResult = await clientDataSource
        .deleteClient(createdUser.id!); // Assert non-null ID with '!'
    print('deleteResult value is: ${deleteResult}');
    expect(deleteResult, isTrue);
  });
}
