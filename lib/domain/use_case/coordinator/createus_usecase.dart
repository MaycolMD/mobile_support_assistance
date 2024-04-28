import 'package:project/domain/repositories/repository_support.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:get/get.dart';

class SupportUserRepositoryUseCase {
  final SupportRepository _repository = Get.put(SupportRepository());
  SupportUserRepositoryUseCase();

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

    await _repository.executeSupportUser(userSupport);
  }
}
