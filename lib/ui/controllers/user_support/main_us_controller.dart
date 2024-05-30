import 'package:get/get.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/domain/use_case/us_usecase.dart';

class MainUSController extends GetxController {
  final RxList<Report> _reports = <Report>[].obs;
  late UserSupport _support;

  final SupportUseCase _supportUseCase = Get.find();
  final ReportUseCase _reportUseCase = Get.find();

  List<Report> get reports => _reports;

  @override
  void onInit() {
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
    await _supportUseCase.getSupports();
  }
}
