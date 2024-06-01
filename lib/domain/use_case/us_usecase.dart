import 'package:project/domain/repositories/interfaces/I_support_repository.dart';
import 'package:project/domain/entities/user_support.dart';

class SupportUseCase {
  final ISupportRepository _repository;
  SupportUseCase(this._repository);

  Future<List<UserSupport>> getSupports() async {
    return await _repository.getSupports();
  }

  Future<UserSupport?> getSupportByName(String name) async {
    return await _repository.getSupportByName(name);
  }

  Future<UserSupport?> getSupportById(int id) async {
    return await _repository.getSupportById(id);
  }

  Future<bool> isGetSupport(String email, String password) async {
    return await _repository.isGetSupport(email, password);
  }

  Future<bool> checkEmailExists(String email) async {
    return await _repository.checkEmailExists(email);
  }

  Future<bool> addSupport(UserSupport support) async {
    return await _repository.addSupport(support);
  }

  Future<bool> deleteSupport(int id) async {
    return await _repository.deleteSupport(id);
  }

  Future<bool> updateSupport(UserSupport support) async {
    return await _repository.updateSupport(support);
  }
}
