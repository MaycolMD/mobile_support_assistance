import 'package:project/data/datasources/remote/interfaces/I_support_datasource.dart';
import 'package:project/domain/entities/user_support.dart';

abstract class ISupportRepository {
  final ISupportDataSource _supportDataSource;

  ISupportRepository(this._supportDataSource);

  Future<List<UserSupport>> getSupports();

  Future<UserSupport?> getSupportByName(String name);

  Future<UserSupport?> getSupportById(int id);

  Future<bool> isGetSupport(String email, String password);

  Future<bool> addSupport(UserSupport userSupport);

  Future<bool> checkEmailExists(String email);

  Future<bool> deleteSupport(int id);

  Future<bool> updateSupport(UserSupport userSupport);
}
