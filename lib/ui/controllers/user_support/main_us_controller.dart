import 'package:get/get.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/use_case/report_usecase.dart';

class MainUSController extends GetxController {
  final RxList<Report> _reports = <Report>[].obs;
  final ReportUseCase _reportUseCase = Get.find();

  List<Report> get reports => _reports;

  @override
  void onInit() {
    getAllReports();
    super.onInit();
  }

  Future<void> getAllReports() async {
    _reports.value = await _reportUseCase.getAllReports();
  }
}
