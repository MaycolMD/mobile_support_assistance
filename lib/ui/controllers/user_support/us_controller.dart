import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/domain/use_case/us_usecase.dart';

class USController extends GetxController {
  final RxList<Report> _reports = <Report>[].obs;
  final RxList<String> _supportsName = <String>[].obs;
  final RxList<UserSupport> _supports = <UserSupport>[].obs;

  late UserSupport support;

  final SupportUseCase _supportUseCase = Get.find();
  final ReportUseCase _reportUseCase = Get.find();

  List<Report> get reports => _reports;
  List<String> get supportsNameList => _supportsName;
  List<UserSupport> get supports => _supports;

  @override
  void onInit() {
    getSupportActive();
    super.onInit();
  }

  Future<void> getAllReports(String email) async {
    final RxList<UserSupport> _supports = <UserSupport>[].obs;
    _supports.value = await _supportUseCase.getSupports();

    String supportID = '';
    for (var s in _supports) {
      if (s.email == email) {
        supportID = s.id.toString();
      }
    }

    _reports.value = await _reportUseCase.getReports('', supportID);
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
    final RxList<UserSupport> _supportsTemp = <UserSupport>[].obs;
    _supportsTemp.value = await _supportUseCase.getSupports();

    for (var support in _supports) {
      supportsNameList.add(support.name);
    }
  }

  Future<void> deleteSupport(int id) async {
    logInfo("deleteUser user $id");
    await _supportUseCase.deleteSupport(id);
    getSupportActive();
  }
}
