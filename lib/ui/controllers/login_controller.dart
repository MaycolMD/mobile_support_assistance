import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/use_case/coordinator/createus_usecase.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final SupportUserRepositoryUseCase _supportcase =
      Get.put(SupportUserRepositoryUseCase());

  Future<void> validateLogin() async {
    if (!validateEmail() || !validatePassword()) {
      return;
    }

    try {
      String email = emailController.text;
      String password = passwordController.text;
      if ((email == "a@a.com" || email == "b@b.com") && password == "123456") {
        clearControllers();
        Get.offNamed('/MainPageUC');
      } else if (await _supportcase.isGetSupport(email, password)) {
        clearControllers();
        Get.offNamed('/MainUS');
      } else {
        Get.snackbar('Incorrect credentials', 'Check it please!!');
      }
    } catch (e) {
      Get.snackbar(
          'Error', 'It was not possible to make the login. /n Error: $e');
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  bool validateEmail() {
    String email = emailController.text.trim();
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Please, check your email', 'Email address is wrong');
      return false;
    }
    return true;
  }

  bool validatePassword() {
    String password = passwordController.text;
    if (password.length < 6) {
      Get.snackbar('Please check your password',
          'Your password must be at least 6 characters');
      return false;
    }
    return true;
  }
}
