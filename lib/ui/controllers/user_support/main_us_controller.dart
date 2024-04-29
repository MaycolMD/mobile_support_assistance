import 'package:get/get.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/use_case/report_usecase.dart';

class MainUSController extends GetxController {
  List<Report> _reports = <Report>[].obs;
  final ReportUseCase _reportUseCase = Get.put(ReportUseCase());

  List<Report> get reports => _reports;

  @override
  void onInit() {
    getReports('', '');
    super.onInit();
  }

  getReports(String clientID, String supportID) async {
    _reports = await _reportUseCase.getReports(clientID, supportID);
    update();
  }
}
