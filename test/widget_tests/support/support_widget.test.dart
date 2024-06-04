/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:project/data/core/network_info.dart';
import 'package:project/data/models/report_db.dart';
import 'package:project/domain/repositories/client_repository.dart';
import 'package:project/domain/repositories/interfaces/I_client_repository.dart';
import 'package:project/domain/repositories/interfaces/I_report_repository.dart';
import 'package:project/domain/repositories/interfaces/I_support_repository.dart';
import 'package:project/domain/repositories/report_repository.dart';
import 'package:project/domain/repositories/support_repository.dart';
import 'package:project/domain/use_case/client_usecase.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/domain/use_case/us_usecase.dart';
import 'package:project/ui/controllers/client/client_controller.dart';
import 'package:project/ui/controllers/connectivity_controller.dart';
import 'package:project/ui/controllers/report/report_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/support/create_report.dart';

class FakeUSRepository extends Fake implements SupportRepository {}

class FakeReportRepository extends Fake implements ReportRepository {}

class FakeClientRepository extends Fake implements ClientRepository {}

// Mock classes
class MockClientController extends GetxService
    with Mock
    implements ClientController {
  @override
  final RxList<String> clientsName = <String>[].obs;

  @override
  List<String> get clientsNameList => clientsName;

  @override
  Future<void> getClientsName() async {
    clientsName.addAll(['Luis Lopez', 'Catrina Rubio']);
  }
}

class MockReportController extends GetxService
    with Mock
    implements ReportController {
  final _reportBox = Hive.box<ReportDB>('reports');

  @override
  var selectedClient = 'Client A';
  @override
  var selectedDate = DateTime.now();
  @override
  var selectedTimeStart = const TimeOfDay(hour: 9, minute: 0);
  @override
  var selectedTimeEnd = const TimeOfDay(hour: 17, minute: 0);

  @override
  Future<void> addReport(String date, int userId, String status, String endTime,
      String startTime, String client, String description, String email) async {
    print('Report added');
  }

  Future<void> _syncWithServer(List<ReportDB> reports) async {
    // Lógica para sincronizar con el servidor
    for (var element in reports) {
      print(element);
      await addReportHive(
          element.date,
          element.rating,
          element.status,
          element.endTime,
          element.startTime,
          element.clientID,
          element.description,
          element.supportID);
    }
  }

  void _syncReports() async {
    if (await networkInfo.isConnected()) {
      // Obtener los reportes locales guardados en Hive
      final reports = _reportBox.values.toList();
      print('reports offline');
      print(reports);
      // Sincronizar con el servidor
      await _syncWithServer(reports);
      // Eliminar los reportes locales después de sincronizar con éxito
      _reportBox.deleteAll(_reportBox.keys);
      _reportBox.clear();
    }
  }

  @override
  Future<DateTime?> selectDate(BuildContext context) async {
    return DateTime.now();
  }

  @override
  Future<TimeOfDay?> selectTime(BuildContext context, bool isStartTime) async {
    return const TimeOfDay(hour: 9, minute: 0);
  }
}

class MockUSController extends GetxService with Mock implements USController {}

class MockConnectivyController with Mock implements ConnectivityController {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() async {
    Get.testMode = true;
    Get.put(NetworkInfo());
    Get.put<ISupportRepository>(FakeUSRepository());
    Get.put(SupportUseCase(Get.find()));
    Get.put<IReportRepository>(FakeReportRepository());
    Get.put(ReportUseCase(Get.find()));
    Get.put<IClientRepository>(FakeClientRepository());
    Get.put(ClientUseCase(Get.find()));

    await Hive.initFlutter();
    await Hive.openBox<ReportDB>('reports');
  });

  tearDownAll(() async {
    await Hive.close();
  });

  testWidgets('create_report widget test', (WidgetTester tester) async {
    final controllerReport = MockReportController();
    final controllerClient = MockClientController();
    Get.put<ReportController>(controllerReport);
    Get.put<ClientController>(controllerClient);

    final completer = Completer<void>();

    await tester.pumpWidget(GetMaterialApp(
      home: CreateReport(
        email: 'tesster@gmail.com',
      ),
    ));

    controllerReport._syncReports();
    await controllerClient.getClientsName();
    completer.complete();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Create a new report'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(DropdownButton<String>), findsOneWidget);
    expect(find.byKey(const Key('ButtonSubmitReportUS')), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pump();
    expect(find.text('Catrina Rubio'), findsOneWidget);

    await tester.tap(find.text('Catrina Rubio'));
    await tester.pump();
    expect(find.text('Luis Lopez'), findsOneWidget);

    // Pulsar el botón de Submit
    await tester.tap(find.byKey(const Key('ButtonSubmitReportUS')));
    await tester.pump();
  });
}
*/

//ERROR ON TEST BECAUSE THIS WIDGET NEEDS A NETWORK CONNECTION AND MOCK DO NOT ALLOW THE CONNECTION. HTTP PLUGIN ERROR!