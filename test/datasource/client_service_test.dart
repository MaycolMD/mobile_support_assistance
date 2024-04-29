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
    newUser = UserClient(id: 10, name: 'Tester Client');
  });


  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });

  test('Create, Retrieve, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await clientDataSource.addClient(newUser);
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<UserClient> users = await clientDataSource.getClients();
    // Using firstWhere with orElse to handle the case where no user is found
    UserClient? createdUser =
        users.firstWhereOrNull((user) { print(user.id); return (user.id == newUser.id) ;});

    // // Check if the user was indeed found
    expect(createdUser, isNotNull);

    // // Step 3: Update the entry
    createdUser!.name =
        'Client for test'; // Safe because createdUser is not null here
    bool updateResult = await clientDataSource.updateClient(createdUser);
    print('updateResult: $updateResult');
    expect(updateResult, isTrue);
    print('deleteUser: ${createdUser.id}');
    // Step 4: Delete the entry
    bool deleteResult = await clientDataSource.deleteClient(createdUser.id!); // Assert non-null ID with '!'
    expect(deleteResult, isTrue);
  });
}
