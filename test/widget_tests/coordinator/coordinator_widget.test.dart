import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:mockito/mockito.dart';
import 'package:project/data/core/network_info.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_client.dart';
import 'package:project/domain/entities/user_support.dart';
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
import 'package:project/ui/controllers/report/report_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/coordinator/client_admin/client_admin_page.dart';
import 'package:project/ui/pages/coordinator/client_admin/createclient.dart';
import 'package:project/ui/pages/coordinator/client_admin/deleteClient.dart';
import 'package:project/ui/pages/coordinator/list_supports.dart';
import 'package:project/ui/pages/coordinator/main_uc.dart';
import 'package:project/ui/pages/coordinator/ratingreportspecific.dart';
import 'package:project/ui/pages/coordinator/ratingreportus.dart';
import 'package:project/ui/pages/coordinator/us_admin/createUS.dart';
import 'package:project/ui/pages/coordinator/us_admin/updateUS.dart';
import 'package:project/ui/pages/coordinator/us_admin/us_admin_page.dart';

import '../support/support_widget.test.dart';

class FakeUSRepository extends Fake implements SupportRepository {}

class FakeReportRepository extends Fake implements ReportRepository {}

class FakeClientRepository extends Fake implements ClientRepository {}

class MockUSController extends GetxService with Mock implements USController {
  final RxList<String> _supportsName = <String>[].obs;
  final RxList<UserSupport> _supports = <UserSupport>[].obs;
  @override
  List<String> get supportsNameList => _supportsName;
  @override
  List<UserSupport> get supports => _supports;

  @override
  final RxBool shouldRefresh = true.obs;

  @override
  RxString selectedSupport = 'All Supports'.obs;

  @override
  late UserSupport support;

  @override
  Disposer addListener(GetStateUpdate listener) {
    // TODO: implement addListener
    throw UnimplementedError();
  }

  @override
  Disposer addListenerId(Object? key, GetStateUpdate listener) {
    // TODO: implement addListenerId
    throw UnimplementedError();
  }

  @override
  Future<void> createSupportUser(
      int idInt, String name, String email, String password) {
    // TODO: implement createSupportUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSupport(int id) {
    // TODO: implement deleteSupport
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void disposeId(Object id) {
    // TODO: implement disposeId
  }

  @override
  Future<void> getAllReportsByEmail(String email) {
    // TODO: implement getAllReportsByEmail
    throw UnimplementedError();
  }

  @override
  Future<void> getSupportActive() async {
    UserSupport temp = UserSupport(
        id: 999999999,
        name: 'name',
        role: 'role',
        email: 'email',
        password: 'password');
    _supports.addAll([temp]);
  }

  @override
  Future<void> getSupportById(int id) async {
    support = UserSupport(
        id: id,
        name: 'name',
        role: 'role',
        email: 'email',
        password: 'password');
  }

  @override
  Future<UserSupport?> getSupportByName(String name) async {
    support = UserSupport(
        id: 2,
        name: name,
        role: "support",
        email: 'll@l.com',
        password: '123456789');
    return support;
  }

  @override
  getSupports() {
    // TODO: implement getSupports
    throw UnimplementedError();
  }

  @override
  Future<void> getSupportsName() async {
    _supportsName.addAll(['Natalia Acosta', 'Luis Lopez']);
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  // TODO: implement listeners
  int get listeners => throw UnimplementedError();

  @override
  void notifyChildrens() {
    // TODO: implement notifyChildrens
  }

  @override
  void refresh() {
    // TODO: implement refresh
  }

  @override
  void refreshGroup(Object id) {
    // TODO: implement refreshGroup
  }

  @override
  void removeListener(VoidCallback listener) {}

  @override
  void removeListenerId(Object id, VoidCallback listener) {}

  @override
  List<Report> get reports => throw UnimplementedError();

  @override
  Future<void> selectSupport() {
    throw UnimplementedError();
  }

  @override
  TextEditingController get supportController => throw UnimplementedError();

  @override
  void update([List<Object>? ids, bool condition = true]) {}

  @override
  Future<void> updateSupport(
      int id, String name, String email, String password) {
    throw UnimplementedError();
  }

  @override
  bool validateEmail(String email) {
    throw UnimplementedError();
  }

  @override
  bool validateName(String name) {
    throw UnimplementedError();
  }

  @override
  bool validatePassword(String password) {
    throw UnimplementedError();
  }

  @override
  bool validateUserId(int id) {
    throw UnimplementedError();
  }

  void clear() {
    _supportsName.clear();
  }
}

class MockClientController extends GetxService
    with Mock
    implements ClientController {
  @override
  final RxList<String> clientsName = <String>[].obs;
  @override
  List<String> get clientsNameList => clientsName;

  @override
  RxString selectedClientFilter = 'All Clients'.obs;

  @override
  final RxBool shouldRefresh = true.obs;

  late UserClient client;

  @override
  Future<UserClient> getClientByName(String name) async {
    client = UserClient(id: 999999999, name: name);
    return client;
  }

  @override
  Future<void> getClientsName() async {
    clientsName.addAll(['Luis Lopez', 'Catrina Rubio']);
  }

  void clear() {
    clientsName.clear();
  }
}

class MockReportController extends GetxService
    with Mock
    implements ReportController {
  final RxList<Report> _reports = <Report>[].obs;
  @override
  List<Report> get reports => _reports;

  @override
  Report report = Report(
      id: 0,
      date: "date",
      rating: 0,
      status: "status",
      endTime: "endTime",
      startTime: "startTime",
      clientID: 0,
      description: "description",
      supportID: 0);

  @override
  Future<void> getAllReports() async {
    Report report = Report(
        id: 0,
        date: 'date',
        rating: 0,
        status: 'status',
        endTime: 'endTime',
        startTime: 'startTime',
        clientID: 0,
        description: 'description',
        supportID: 0);
    _reports.addAll([report]);
  }

  @override
  Future<void> getReportById(int id) async {
    Report reportTemp = Report(
        id: id,
        date: "date",
        rating: 0,
        status: "status",
        endTime: "endTime",
        startTime: "startTime",
        clientID: 0,
        description: "description",
        supportID: 0);
    report = reportTemp;
  }

  @override
  Future<int> getNumberOfReportsBySupportID(int supportID) async {
    return 1;
  }

  @override
  Future<int> getAvgRating(int supportID) async {
    return 0;
  }
}

void main() {
  setUp(() {
    Get.testMode = true;

    Get.put<ISupportRepository>(FakeUSRepository());
    Get.put(SupportUseCase(Get.find()));
    Get.put<IReportRepository>(FakeReportRepository());
    Get.put(ReportUseCase(Get.find()));
    Get.put<IClientRepository>(FakeClientRepository());
    Get.put(ClientUseCase(Get.find()));
  });

  testWidgets('main_uc widget test', (WidgetTester tester) async {
    String testEmail = 'test@example.com';

    await tester.pumpWidget(MaterialApp(
      home: MainPageUC(email: testEmail),
    ));
    await tester.pumpAndSettle();
    expect(find.text('Coordinator'), findsOneWidget);

    expect(find.text('US Admin'), findsOneWidget);
    expect(find.text('Client Admin'), findsOneWidget);
    expect(find.text('Reports'), findsOneWidget);
    expect(find.text('Supports'), findsOneWidget);

    expect(find.byKey(Key('ButtonGoBack')), findsOneWidget);
  });

  testWidgets('us_admin_page widget test', (WidgetTester tester) async {
    String testEmail = 'test@example.com';

    await tester.pumpWidget(MaterialApp(
      home: AdminPageUS(email: testEmail),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Administration for US'), findsOneWidget);

    expect(find.text('Add an US'), findsOneWidget);
    expect(find.text('Update an US'), findsOneWidget);
    expect(find.text('Remove an US'), findsOneWidget);

    expect(find.byKey(Key('ButtonGoBack')), findsOneWidget);
  });

  group('crud for us_admin widgets', () {
    testWidgets('createUS widget test', (WidgetTester tester) async {
      final mockController = MockUSController();
      Get.put<USController>(mockController);

      String testEmail = 'test@example.com';

      await tester.pumpWidget(MaterialApp(
        home: CreateUser(email: testEmail),
      ));
      await tester.pumpAndSettle();

      expect(find.text('NEW SUPPORT USER'), findsOneWidget);

      expect(find.byType(TextField), findsNWidgets(4));

      expect(find.byKey(const Key('ButtonSubmit')), findsOneWidget);
      expect(find.byKey(const Key('ButtonGoBack')), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(0), "99999999");
      await tester.enterText(find.byType(TextField).at(1), 'John Doe');
      await tester.enterText(find.byType(TextField).at(2), 'john@example.com');
      await tester.enterText(find.byType(TextField).at(3), 'password');

      await tester.tap(find.byKey(const Key('ButtonSubmit')));
      await tester.pumpAndSettle();
    });

    testWidgets('updateUS widget test', (WidgetTester tester) async {
      final controller = MockUSController();
      Get.replace<USController>(controller);

      final completer = Completer<void>();

      await tester.pumpWidget(const GetMaterialApp(
        home: UpdateUS(
          email: 'tesster@gmail.com',
        ),
      ));

      await controller.getSupportsName();
      completer.complete();
      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.text('UPDATE A SUPPORT USER'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_downward));
      await tester.pumpAndSettle();

      expect(find.text('Luis Lopez'), findsOneWidget);

      await tester.tap(find.text('Luis Lopez'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      await controller.getSupportByName('Luis Lopez');
      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.byType(TextField), findsNWidgets(4));

      await tester.tap(find.byKey(const Key('ButtonGoBack')));
      await tester.pumpAndSettle();

      controller.clear();
      Get.delete<USController>();
    });

    /*testWidgets('deleteUS widget test', (WidgetTester tester) async {
      final controller = MockUSController();
      Get.replace<USController>(controller);

      final completer = Completer<void>();

      await tester.pumpWidget(const GetMaterialApp(
        home: UpdateUS(
          email: 'tesster@gmail.com',
        ),
      ));

      controller.clear();
      await controller.getSupportsName();
      completer.complete();
      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.text('REMOVE A SUPPORT USER'), findsOneWidget);
    });*/
  });

  testWidgets('client_admin_page widget test', (WidgetTester tester) async {
    String testEmail = 'test@example.com';

    await tester.pumpWidget(MaterialApp(
      home: AdminPageClient(email: testEmail),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Administration for Clients'), findsOneWidget);

    expect(find.text('Add a Client'), findsOneWidget);
    expect(find.text('Update a Client'), findsOneWidget);
    expect(find.text('Remove a Client'), findsOneWidget);

    expect(find.byKey(Key('ButtonGoBack')), findsOneWidget);
  });

  group('crud for client_admin widgets', () {
    testWidgets('createclient widget test', (WidgetTester tester) async {
      final mockController = MockClientController();
      Get.put<ClientController>(mockController);

      String testEmail = 'test@example.com';

      await tester.pumpWidget(MaterialApp(
        home: CreateClient(email: testEmail),
      ));
      await tester.pumpAndSettle();

      expect(find.text('NEW CLIENT'), findsOneWidget);

      expect(find.byType(TextField), findsNWidgets(2));

      expect(find.byKey(const Key('ButtonSubmit')), findsOneWidget);
      expect(find.byKey(const Key('ButtonGoBack')), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(0), "99999999");
      await tester.enterText(find.byType(TextField).at(1), 'John Doe');

      await tester.tap(find.byKey(const Key('ButtonSubmit')));
      await tester.pumpAndSettle();
    });

    testWidgets('deleteclient widget test', (WidgetTester tester) async {
      final controller = MockClientController();
      Get.replace<ClientController>(controller);

      final completer = Completer<void>();

      await tester.pumpWidget(const GetMaterialApp(
        home: DeleteClient(
          email: 'tesster@gmail.com',
        ),
      ));

      await controller.getClientsName();
      completer.complete();
      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.text('REMOVE A CLIENT USER'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_downward));
      await tester.pumpAndSettle();

      expect(find.text('Catrina Rubio'), findsOneWidget);

      await tester.tap(find.text('Catrina Rubio'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      await controller.getClientByName('Catrina Rubio');
      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.text('Catrina Rubio'), findsNWidgets(2));

      await tester.tap(find.byKey(const Key('ButtonGoBack')));
      await tester.pumpAndSettle();

      controller.clear();
      Get.delete<USController>();
    });
  });

  /*group('reports widget test', () {
    testWidgets('ratingreportus widget test', (WidgetTester tester) async {
      final controllerUS = MockUSController();
      final controllerClient = MockClientController();
      final controllerReport = MockReportController();

      Get.replace<MockClientController>(controllerClient);
      Get.replace<MockReportController>(controllerReport);
      Get.replace<MockUSController>(controllerUS);

      final completer = Completer<void>();

      await tester.pumpWidget(const GetMaterialApp(
        home: RatingReportUS(
          email: 'tesster@gmail.com',
        ),
      ));

      await tester.pumpAndSettle(Duration(seconds: 5));

      await controllerReport.getAllReports();
      completer.complete();

      expect(find.text('REPORTS'), findsOneWidget);

      expect(find.text('All Clients'), findsOneWidget);
      expect(find.text('All Supports'), findsOneWidget);

      expect(find.byKey(const Key('reviewButton0')), findsOneWidget);
    });
  });*/

  /*testWidgets('list_supports widget test', (WidgetTester tester) async {
    Get.put(NetworkInfo());
    final controllerUS = MockUSController();
    final controllerReport = MockReportController();

    Get.replace<MockReportController>(controllerReport);
    Get.replace<MockUSController>(controllerUS);

    final completer = Completer<void>();
    await tester.pumpWidget(GetMaterialApp(
      home: ListSupporters(email: 'tesster@gmail.com'),
    ));
    await tester.pumpAndSettle(Duration(seconds: 5));

    await controllerUS.getSupportActive();
    await controllerReport.getNumberOfReportsBySupportID(0);
    await controllerReport.getAvgRating(0);
    completer.complete();
    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.text('OUR PARTNERS'), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(2));
    expect(find.byKey(Key('ButtonGoBack')), findsOneWidget);
  });*/
}
