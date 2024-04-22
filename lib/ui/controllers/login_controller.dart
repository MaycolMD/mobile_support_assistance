import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validateLogin() {
    String email = emailController.text;
    String password = passwordController.text;
    if ((email == "a@a.com" || email == "b@b.com") && password == "123456") {
      clearControllers();
      Get.offNamed('/MainPageUC');
    } else {
      clearControllers();
      Get.offNamed('/MainUS');
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
