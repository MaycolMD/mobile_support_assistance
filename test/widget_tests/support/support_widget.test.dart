//FUTURE BUILDER STOP THE TEST

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:project/ui/controllers/client/client_controller.dart';
import 'package:project/ui/controllers/report/report_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/support/create_report.dart';
import 'package:project/ui/pages/support/main_us.dart';

// Mock classes
class MockClientController extends GetxService
    with Mock
    implements ClientController {
  @override
  var clientsNameList = <String>[].obs;

  @override
  Future<void> getClientsName() async {
    clientsNameList.addAll(['Client A', 'Client B', 'Client C']);
  }
}

class MockReportController extends GetxService
    with Mock
    implements ReportController {
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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('main_us widget test', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      home: MainUS(),
    ));

    // Verificar que el widget AppBar está presente
    expect(find.byType(AppBar), findsOneWidget);

    // Verificar que el widget CircularProgressIndicator está presente mientras espera la carga
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Verificar que el mensaje de bienvenida no está presente mientras espera la carga
    expect(find.text('Welcome, '), findsNothing);

    // Verificar que el botón "Add Report" está presente mientras espera la carga
    expect(find.byKey(Key('ButtonCreateReport')), findsOneWidget);

    // Esperar a que se complete la carga
    await tester.pumpAndSettle();

    // Verificar que el widget AppBar sigue presente después de la carga
    expect(find.byType(AppBar), findsOneWidget);

    // Verificar que el widget CircularProgressIndicator ya no está presente después de la carga
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Verificar que el mensaje de bienvenida está presente después de la carga
    expect(find.text('Welcome, '), findsOneWidget);

    // Verificar que el botón "Add Report" sigue presente después de la carga
    expect(find.byKey(Key('ButtonCreateReport')), findsOneWidget);
  });

  testWidgets('create_report widget test', (WidgetTester tester) async {
    final clientController = MockClientController();
    final reportController = MockReportController();
    final completer = Completer<void>();

    Get.put<ClientController>(clientController);
    Get.put<ReportController>(reportController);

    await clientController.getClientsName();
    // Construir el widget
    await tester.pumpWidget(const GetMaterialApp(
      home: CreateReport(),
    ));

    // Completar el Future después de inicializar el widget
    completer.complete();
    await tester.pumpAndSettle(Duration(seconds: 5));
    // Verificar que el widget inicial tiene los textos esperados
    expect(find.text('Create a new report'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(DropdownButton<String>), findsOneWidget);
    expect(find.byKey(const Key('ButtonSubmitReportUS')), findsOneWidget);

    // Escribir en el campo de descripción
    await tester.enterText(
        find.byType(TextField), 'Description about your support');
    expect(find.text('Description about your support'), findsOneWidget);

    // Verificar que el Dropdown muestra los clientes
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pump();
    expect(find.text('Client A'), findsOneWidget);
    expect(find.text('Client B'), findsOneWidget);
    expect(find.text('Client C'), findsOneWidget);

    // Seleccionar un cliente del Dropdown
    await tester.tap(find.text('Client B').last);
    await tester.pump();
    expect(find.text('Client B'), findsOneWidget);

    // Pulsar el botón de Submit
    await tester.tap(find.byKey(const Key('ButtonSubmitReportUS')));
    await tester.pump();

    // Verificar que el método addReport se llamó una vez
    //verify(reportController.addReport(any, any, any, any, any, any, any, any)).called(1);
  });
}
