import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:loggy/loggy.dart';
import 'package:project/data/core/network_info.dart';
import 'package:project/data/datasources/local/interfaces/I_report_local_datasource.dart';
import 'package:project/data/datasources/local/report_local_datasource.dart';
import 'package:project/data/datasources/remote/client_datasource.dart';
import 'package:project/data/datasources/remote/interfaces/I_client_datasource.dart';
import 'package:project/data/datasources/remote/interfaces/I_report_datasource.dart';
import 'package:project/data/datasources/remote/interfaces/I_support_datasource.dart';
import 'package:project/data/datasources/remote/report_datasource.dart';
import 'package:project/data/datasources/remote/support_datasource.dart';
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
import 'package:project/main.dart';
import 'package:project/ui/controllers/client/client_controller.dart';
import 'package:project/ui/controllers/login_controller.dart';
import 'package:project/ui/controllers/report/report_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';

void main() {
  Get.put(NetworkInfo());
  Get.put<IReportLocalDataSource>(ReportLocalDataSource());

  Get.put<IClientDataSource>(ClientDataSource());
  Get.put<IReportDataSource>(ReportDataSource());
  Get.put<ISupportDataSource>(SupportDataSource());

  Get.put<IClientRepository>(ClientRepository(Get.find()));
  Get.put<IReportRepository>(ReportRepository(Get.find()));
  Get.put<ISupportRepository>(SupportRepository(Get.find()));

  Get.put(ClientUseCase(Get.find()));
  Get.put(ReportUseCase(Get.find()));
  Get.put(SupportUseCase(Get.find()));

  Get.put(LoginController());
  Get.put(NetworkInfo());

  Future<Widget> createHomeScreen() async {
    WidgetsFlutterBinding.ensureInitialized();
    return const MyApp();
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Hive.initFlutter();
    await Hive.openBox<ReportDB>('reports');
  });

  tearDownAll(() async {
    await Hive.close();
  });

  testWidgets("login --> login éxitoso", (WidgetTester tester) async {
    Get.put(LoginController());
    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(find.byKey(const Key('email')), 'a@a.com');
    await tester.enterText(find.byKey(const Key('password')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLogin')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Your Support Assistance'), findsNothing);
  });

  testWidgets("login -> create a client -> delete a client",
      (WidgetTester tester) async {
    Get.put(LoginController());
    Get.put(ClientController());
    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(find.byKey(const Key('email')), 'a@a.com');
    await tester.enterText(find.byKey(const Key('password')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLogin')));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Coordinator'), findsOneWidget);

    //go to the client
    await tester.tap(find.byIcon(Icons.group_add));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Administration for Clients'), findsOneWidget);

    await tester.tap(find.text('Add a Client'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byType(TextField), findsNWidgets(2));

    await tester.enterText(find.byType(TextField).at(0), "99999999");
    await tester.enterText(find.byType(TextField).at(1), 'John Doe');

    await tester.tap(find.byKey(const Key('ButtonSubmit')));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    Get.replace(ClientController());
    expect(find.text('Administration for Clients'), findsOneWidget);

    await tester.tap(find.text('Remove a Client'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.arrow_downward));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('John Doe'), findsOneWidget);

    await tester.tap(find.text('John Doe'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byKey(const Key('ButtonSubmit')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonSubmit')));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    Get.replace(ClientController());
    expect(find.text('REMOVE A CLIENT USER'), findsNothing);
  });

  testWidgets("login -> add report -> submit report -> check on main page",
      (WidgetTester tester) async {
    Get.put(LoginController());
    Get.put(ClientController());
    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(find.byKey(const Key('email')), 'juan@gmail.com');
    await tester.enterText(find.byKey(const Key('password')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLogin')));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    Get.put(USController());

    expect(find.byKey(const Key('ButtonCreateReport')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonCreateReport')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    Get.put(ReportController());
    Get.replace(ClientController());

    await tester.tap(find.byKey(const Key('clientSelector')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.tap(find.text('Julio Y Salas'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.calendar_month));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.enterText(
        find.byKey(const Key('description')), "report bed on a test.");

    await tester.tap(find.byIcon(Icons.access_time).at(0));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.access_time).at(1));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    Get.replace(ReportController());

    expect(find.byIcon(Icons.add), findsAny);
  });
}
