import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/models/report_db.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/domain/use_case/us_usecase.dart';

class USController extends GetxController {
  final RxList<Report> _reports = <Report>[].obs;
  final RxList<ReportDB> _reportsLocal = <ReportDB>[].obs;

  final RxList<String> _supportsName = <String>[].obs;
  final RxList<UserSupport> _supports = <UserSupport>[].obs;

  late UserSupport support;

  final RxBool shouldRefresh = true.obs;

  final SupportUseCase _supportUseCase = Get.find();
  final ReportUseCase _reportUseCase = Get.find();

  final TextEditingController supportController = TextEditingController();
  RxString selectedSupport = 'All Supports'.obs;

  List<Report> get reports => _reports;
  List<String> get supportsNameList => _supportsName;
  List<UserSupport> get supports => _supports;

  @override
  void onInit() {
    getSupportActive();
    super.onInit();
  }

  Future<void> selectSupport() async {
    if (selectedSupport.value == 'All Supports') {
      // Mostrar TextField para ingresar ID de soporte
      Get.dialog(
        AlertDialog(
          title: const Text('Enter Support ID'),
          content: TextField(
            controller: supportController,
            decoration: const InputDecoration(
              hintText: 'Enter Support ID',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                selectedSupport.value = supportController.text.isNotEmpty
                    ? supportController.text
                    : 'All Supports';
                supportController.clear();
                Get.back();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      );
    } else {
      selectedSupport.value = 'All Supports';
    }
    shouldRefresh.value = true;
  }

  Future<void> getAllReportsByEmail(String email) async {
    final RxList<UserSupport> supports = <UserSupport>[].obs;
    supports.value = await _supportUseCase.getSupports();

    String supportID = '';
    for (var s in supports) {
      if (s.email == email) {
        supportID = s.id.toString();
      }
    }

    _reports.value = await _reportUseCase.getReports('', supportID);
  }

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

  Future<void> getSupportActive() async {
    _supports.value = await _supportUseCase.getSupports();
    print(_supports);
  }

  Future<UserSupport?> getSupportByName(String name) async {
    try {
      final userData = await _supportUseCase.getSupportByName(name);
      return userData;
    } catch (e) {
      print("Error obteniendo usuario: $e");
      return null;
    }
  }

  Future<void> getSupportById(int id) async {
    final userData = await _supportUseCase.getSupportById(id);
    support = userData!;
  }

  Future<void> getSupportsName() async {
    final RxList<UserSupport> supportsTemp = <UserSupport>[].obs;
    supportsTemp.value = await _supportUseCase.getSupports();

    for (var support in _supports) {
      supportsNameList.add(support.name);
    }
  }
}
