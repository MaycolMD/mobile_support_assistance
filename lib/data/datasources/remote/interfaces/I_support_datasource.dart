import 'package:project/domain/entities/user_support.dart';

abstract class ISupportDataSource {
  Future<List<UserSupport>> getSupports();

  Future<bool> isGetSupport(String email, String password);

  Future<bool> addSupport(UserSupport userSupport);

  Future<bool> checkEmailExists(String email);

  Future<bool> deleteSupport(int id);

  Future<bool> updateSupport(UserSupport userSupport);
}
