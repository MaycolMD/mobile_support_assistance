import 'package:mockito/annotations.dart';
import 'package:project/data/datasources/remote/interfaces/I_support_datasource.dart';
import 'package:project/domain/repositories/interfaces/I_support_repository.dart';

@GenerateMocks([ISupportDataSource])
@GenerateMocks([ISupportRepository])
void main() {}
