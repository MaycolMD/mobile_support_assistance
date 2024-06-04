import 'dart:async';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project/data/core/network_info.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/data/models/report_db.dart';

import '../../ui/controllers/report/report_controller.dart';

class SyncService extends GetxService {
  final ReportUseCase reportUseCase = Get.find();
  final NetworkInfo networkInfo = Get.find();

  late Box<ReportDB> reportBox;
  late StreamSubscription<bool> _internetStatusSubscription;

  @override
  void onInit() {
    super.onInit();
    _internetStatusSubscription = networkInfo.stream.listen((isConnected) {
      if (isConnected) {
        // Si hay conexión a Internet, sincroniza los reportes con el servidor
        print('hola, hay');

        final ReportController controller = Get.put(ReportController());

        controller.onInit();
      } else {
        // Si no hay conexión a Internet, puedes realizar alguna acción aquí, como mostrar un mensaje al usuario
        print('No hay conexión a Internet');
      }
    });
  }

  @override
  void onClose() {
    _internetStatusSubscription.cancel();
    super.onClose();
  }
}
