import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/coordinator/createus_usecase.dart';
import 'package:project/domain/use_case/report_usecase.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final SupportUserRepositoryUseCase _supportcase =
      Get.put(SupportUserRepositoryUseCase());

  List<UserSupport> _supports = <UserSupport>[].obs;
  List<UserSupport> get supports => _supports;

  Future<List<UserSupport>> getSupports() async {
    _supports = await _supportcase.getSupports();
    return _supports;
  }

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
      } else if (await _supportcase.isGetSupportByEmail(email)) {
        _supports = await getSupports();
        print(_supports);
        for (var element in supports) {
          if (element.email == email && element.password == password) {
            clearControllers();
            Get.offNamed('/MainUS');
          } else {
            Get.snackbar('Please check your password', 'It does not match!!');
          }
        }
      } else {
        Get.snackbar('Please, check your email', 'It does not exist for us!!');
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
