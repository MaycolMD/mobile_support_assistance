import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/client_datasource.dart';
import 'package:project/data/datasources/remote/support_datasource.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/entities/user_support.dart';

void main() {
  late SupportDataSource
    datasource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late UserSupport newUser; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    datasource = SupportDataSource(client: httpClient);
    newUser = UserSupport(id: 10, name: 'Support Client', email: 'support@a.com', password: '1234567890', role: 'Support');
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });
  test('Create, Retrieve, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await datasource.addSupport(newUser);
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<UserSupport> users = await datasource.getSupports();
    // Using firstWhere with orElse to handle the case where no user is found
    UserSupport? createdUser =
        users.firstWhereOrNull((user) { print(user.id); return (user.id == newUser.id) ;});

    // // Check if the user was indeed found
    expect(createdUser, isNotNull);

    // // Step 3: Update the entry
    createdUser!.name =
        'Support for test'; // Safe because createdUser is not null here
    bool updateResult = await datasource.updateSupport(createdUser);
    print('updateResult: $updateResult');
    expect(updateResult, isTrue);
    print('deleteUser: ${createdUser.id}');
    // Step 4: Delete the entry
    bool deleteResult = await datasource.deleteSupport(createdUser.id!); // Assert non-null ID with '!'
    expect(deleteResult, isTrue);
  });
}
