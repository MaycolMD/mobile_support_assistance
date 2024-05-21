import 'package:project/data/datasources/remote/interfaces/I_support_datasource.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/repositories/interfaces/I_support_repository.dart';

class SupportRepository implements ISupportRepository {
  final ISupportDataSource _supportDataSource;
  String token = "";

  SupportRepository(this._supportDataSource);

  @override
  Future<List<UserSupport>> getSupports() async =>
      await _supportDataSource.getSupports();

  @override
  Future<bool> isGetSupport(String email, String password) async =>
      await _supportDataSource.isGetSupport(email, password);

  @override
  Future<bool> addSupport(UserSupport user) async =>
      await _supportDataSource.addSupport(user);

  @override
  Future<bool> checkEmailExists(String email) async =>
      await _supportDataSource.checkEmailExists(email);

  @override
  Future<bool> deleteSupport(int id) async =>
      await _supportDataSource.deleteSupport(id);

  @override
  Future<bool> updateSupport(UserSupport user) async =>
      await _supportDataSource.updateSupport(user);

}
