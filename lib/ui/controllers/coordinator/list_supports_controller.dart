import 'package:get/get.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/domain/use_case/us_usecase.dart';
import 'package:project/ui/pages/support/recap_report.dart';

class ListSupportsController extends GetxController {
  final RxList<UserSupport> _supports = <UserSupport>[].obs;

  final SupportUseCase supportUseCase = Get.find();
  final ReportUseCase reportUseCase = Get.find();

  List<UserSupport> get supports => _supports;

  int numberOfReports = 0;
  double avgRating = 0;

  @override
  void onInit() {
    getSupports();
    super.onInit();
  }

  Future<void> getSupports() async {
    _supports.value = await supportUseCase.getSupports();
  }

  Future<void> getNumberOfReportsBySupportId(String supportId) async {
    List<Report> report = await reportUseCase.getReports('', supportId);
    numberOfReports = report.length;
  }

  Future<void> getRating(String supportId) async {
    List<Report> report = await reportUseCase.getReports('', supportId);
    int temp = 0;
    for (var element in report) {
      temp = temp + element.rating;
    }
    avgRating = temp / report.length;
  }
}
