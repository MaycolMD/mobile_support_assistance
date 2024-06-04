import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/support_datasource.dart';
import 'package:project/domain/entities/user_support.dart';

void main() {
  late SupportDataSource datasource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late UserSupport newUser; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    datasource = SupportDataSource(client: httpClient);
    newUser = UserSupport(
        id: 999999999,
        name: 'Supporter',
        email: 'support@a.com',
        password: '1234567890',
        role: 'support');
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });
  test('Create, Get supports, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await datasource.addSupport(newUser);
    print('createResult value is: $createResult');
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<UserSupport> users = await datasource.getSupports();
    // Using firstWhere with orElse to handle the case where no user is found
    UserSupport? createdUser = users.firstWhereOrNull((user) {
      print(user.id);
      return (user.id == newUser.id);
    });

    print('createdUser.id value is: ${createdUser!.id}');
    expect(createdUser, isNotNull);

    // // Step 3: Update the entry
    createdUser.name =
        'Support Name 1'; // Safe because createdUser is not null here
    bool updateResult = await datasource.updateSupport(createdUser);
    print('updateResult value is $updateResult');
    expect(updateResult, isTrue);

    // Step 4: Delete the entry
    bool deleteResult = await datasource
        .deleteSupport(createdUser.id!); // Assert non-null ID with '!'
    print('deleteResult value is  $deleteResult');
    expect(deleteResult, isTrue);
  });

  test(
      'Is get support, Check if email exists,  Create, get support by name, delete an entry, and Get support by id',
      () async {
    bool isGetSupportResult =
        await datasource.isGetSupport(newUser.email, newUser.password);
    print('isGetSupportResult value is $isGetSupportResult');
    expect(isGetSupportResult, isFalse);

    bool checkEmail = await datasource.checkEmailExists(newUser.email);
    print('checkEmail value is $checkEmail');
    expect(checkEmail, isFalse);

    bool createResult = await datasource.addSupport(newUser);
    print('createResult value is: $createResult');
    expect(createResult, isTrue);

    UserSupport? userSupport = await datasource.getSupportByName(newUser.name);
    print('userSupport.name value is ${userSupport!.name}');
    expect(userSupport, isNotNull);

    bool deleteResult = await datasource.deleteSupport(userSupport.id!);
    print('deleteResult value is $deleteResult');
    expect(deleteResult, isTrue);

    UserSupport? userSupport2 =
        await datasource.getSupportById(userSupport.id!);
    print('userSupport2 value is $userSupport2');
    expect(userSupport2, isNull);
  });
}
