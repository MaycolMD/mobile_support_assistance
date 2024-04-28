import 'package:project/data/datasources/remote/support_datasource.dart';
import 'package:project/domain/entities/user_support.dart';

class SupportRepository {
  late SupportDataSource _supportDataSource;
  String token = "";

  SupportRepository() {
    _supportDataSource = SupportDataSource();
  }

  Future<bool> executeSupportUser(UserSupport user) async =>
      await _supportDataSource.addSupport(user);

  Future<bool> checkEmailExists(String email) async =>
      await _supportDataSource.checkEmailExists(email);
}
