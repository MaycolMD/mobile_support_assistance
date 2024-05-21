import 'package:project/domain/repositories/interfaces/I_support_repository.dart';
import 'package:project/domain/entities/user_support.dart';

class SupportUserRepositoryUseCase {
  final ISupportRepository _repository;
  SupportUserRepositoryUseCase(this._repository);

  Future<List<UserSupport>> getSupports() async {
    return await _repository.getSupports();
  }

  Future<bool> isGetSupport(String email, String password) async {
    return _repository.isGetSupport(email, password);
  }

  Future<void> addSupportUser(
      int id, String name, String email, String password, String role) async {
    bool emailExists = await _repository.checkEmailExists(email);

    if (emailExists) {
      throw Exception('El correo electrónico ya está en uso');
    }

    UserSupport userSupport = UserSupport(
      id: id,
      name: name,
      email: email,
      password: password,
      role: role,
    );

    await _repository.addSupport(userSupport);
  }

  Future<void> deleteSupport(int id) async {
    await _repository.deleteSupport(id);
  }

  Future<void> updateSupport(
      int id, String name, String email, String password, String role) async {
    UserSupport userSupport = UserSupport(
      id: id,
      name: name,
      email: email,
      password: password,
      role: role,
    );

    await _repository.updateSupport(userSupport);
  }
}
