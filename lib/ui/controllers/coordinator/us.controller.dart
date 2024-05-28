import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/us_usecase.dart';

class FormControllers extends GetxController {
  final SupportUseCase _supportUseCase = Get.find();

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // Método para crear un nuevo usuario de soporte
  Future<void> createSupportUser(
      int idInt, String name, String email, String password) async {
    if (!validateUserId(idInt) ||
        !validateName(name) ||
        !validateEmail(email) ||
        !validatePassword(password)) {
      return;
    }

    String role = 'support';
    try {
      if (await _supportUseCase.checkEmailExists(email)) {
        throw Exception('El correo electrónico ya está en uso');
      }

      UserSupport userSupport = UserSupport(
        id: idInt,
        name: name,
        email: email,
        password: password,
        role: role,
      );
      await _supportUseCase.addSupport(userSupport);
      Get.snackbar('Éxito', 'El usuario de soporte ha sido creado');
    } catch (e) {
      Get.snackbar('Error', 'No se ha podido crear el usuario. error: $e');
    }
  }

  getSupports() async {
    await _supportUseCase.getSupports();
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
      UserSupport support = UserSupport(
        id: id,
        name: name.trim(),
        email: email.trim(),
        password: password,
        role: 'support',
      );

      await _supportUseCase.updateSupport(support);
      Get.snackbar('Success', 'User has been updated!!');
    } catch (e) {
      Get.snackbar('Error', 'Something wrong. error: $e');
    }
  }

  // Método para eliminar un usuario de soporte
  Future<void> deleteSupport(int id) async {
    await _supportUseCase.deleteSupport(id);
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
