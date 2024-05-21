import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/use_case/us_usecase.dart';

class FormControllers extends GetxController {
  final SupportUserRepositoryUseCase _createSupportUserUseCase = Get.find();

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // Método para crear un nuevo usuario de soporte
  Future<void> createSupportUser(
      int id, String name, String email, String password) async {
    if (!validateUserId(id) ||
        !validateName(name) ||
        !validateEmail(email) ||
        !validatePassword(password)) {
      return;
    }

    String role = 'support';
    try {
      await _createSupportUserUseCase.addSupportUser(
          id, name.trim(), email.trim(), password, role);
      Get.snackbar('Éxito', 'El usuario de soporte ha sido creado');
    } catch (e) {
      Get.snackbar('Error', 'No se ha podido crear el usuario. error: $e');
    }
  }

  getSupports() async {
    await _createSupportUserUseCase.getSupports();
  }

  // Método para actualizar un usuario de soporte
  Future<void> updateSupport(
      int id, String name, String email, String password) async {
    if (!validateName(name) ||
        !validateEmail(email) ||
        !validatePassword(password)) {
      return;
    }

    try {
      await _createSupportUserUseCase.updateSupport(
          id, name.trim(), email.trim(), password, 'support');
      Get.snackbar('Success', 'User has been updated!!');
    } catch (e) {
      Get.snackbar('Error', 'Something wrong. error: $e');
    }
  }

  // Método para eliminar un usuario de soporte
  Future<void> deleteSupport(int id) async {
    await _createSupportUserUseCase.deleteSupport(id);
  }

  bool validateUserId(int id) {
    if (id <= 0) {
      Get.snackbar('Revisa tu ID', 'Identificación inválida');
      return false;
    }
    return true;
  }

  bool validateName(String name) {
    if (name.isEmpty) {
      Get.snackbar('Revisa tu nombre', 'El campo no puede estar vacío');
      return false;
    }
    return true;
  }

  bool validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Revisa tu email', 'Dirección de correo inválida');
      return false;
    }
    return true;
  }

  bool validatePassword(String password) {
    if (password.length < 6) {
      Get.snackbar('Revisa tu contraseña',
          'Tu contraseña debe tener al menos 6 caracteres');
      return false;
    }
    return true;
  }
}
