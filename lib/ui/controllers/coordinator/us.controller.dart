import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/us_usecase.dart';

class FormControllers extends GetxController {
  final SupportUserRepositoryUseCase _createSupportUserUseCase =
      Get.find();


  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Método para crear un nuevo usuario de soporte
  Future<void> createSupportUser() async {
    if (!validateUserId() ||
        !validateName() ||
        !validateEmail() ||
        !validatePassword()) {
      return;
    }

    String role = 'support';
    try {
      await _createSupportUserUseCase.addSupportUser(
          int.parse(userIdController.text),
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text,
          role);
      Get.snackbar('Éxito', 'El usuario de soporte ha sido creado');
    } catch (e) {
      Get.snackbar('Error', 'No se ha podido crear el usuario. error: $e');
    }
  }

  
  getSupports() async {
    await _createSupportUserUseCase.getSupports();
  }
  
  updateSupport(UserSupport client) async {
    await _createSupportUserUseCase.updateSupport(client);
  }

  deleteSupport(int id) async {
    await _createSupportUserUseCase.deleteSupport(id);
  }

  bool validateUserId() {
    int? id = int.tryParse(userIdController.text);
    if (id == null || id <= 0) {
      Get.snackbar('Revisa tu ID', 'Identificación inválida');
      return false;
    }
    return true;
  }

  bool validateName() {
    String name = nameController.text.trim();
    if (name.isEmpty) {
      Get.snackbar('Revisa tu nombre', 'El campo no puede estar vacío');
      return false;
    }
    return true;
  }

  bool validateEmail() {
    String email = emailController.text.trim();
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Revisa tu email', 'Dirección de correo inválida');
      return false;
    }
    return true;
  }

  bool validatePassword() {
    String password = passwordController.text;
    if (password.length < 6) {
      Get.snackbar('Revisa tu contraseña',
          'Tu contraseña debe tener al menos 6 caracteres');
      return false;
    }
    return true;
  }
}
