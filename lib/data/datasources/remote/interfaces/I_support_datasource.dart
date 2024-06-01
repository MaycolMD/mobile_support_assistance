import 'package:project/domain/entities/user_support.dart';

abstract class ISupportDataSource {
  Future<List<UserSupport>> getSupports();

  Future<UserSupport?> getSupportById(int id);

  Future<bool> isGetSupport(String email, String password);

  Future<bool> addSupport(UserSupport userSupport);

  Future<UserSupport?> getSupportByName(String name);

  Future<bool> checkEmailExists(String email);

  Future<bool> deleteSupport(int id);

  Future<bool> updateSupport(UserSupport userSupport);
}
