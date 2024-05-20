import 'package:project/data/datasources/remote/interfaces/I_client_datasource.dart';
import 'package:project/domain/repositories/interfaces/I_client_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([IClientDataSource])
@GenerateMocks([IClientRepository])
@GenerateMocks([http.Client])
void main() {}
