import 'package:http/http.dart' as http;
import 'package:project/data/datasources/remote/client_datasource.dart';
import 'package:project/domain/entities/user_client.dart';

void main(){
  late ClientDataSource clientDataSource; // Declared as late, initialized in setUp
  late http.Client httpClient; // Declared as late, initialized in setUp
  late UserClient newUser; // User without an ID yet

  setUp(() {
    httpClient = http.Client();
    clientDataSource = ClientDataSource(client: httpClient);
    newUser = UserClient(
        id: 1,
        name: 'Tester Client')
  });
}