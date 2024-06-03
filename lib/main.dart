import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
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
import 'package:project/ui/controllers/client/client_controller.dart';
import 'package:project/ui/controllers/login_controller.dart';
import 'package:project/ui/controllers/report/report_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/coordinator/client_admin/deleteClient.dart';
import 'package:project/ui/pages/coordinator/client_admin/updateClient.dart';
import 'package:project/ui/pages/coordinator/list_supports.dart';
import 'package:project/ui/pages/coordinator/us_admin/us_admin_page.dart';
import 'package:project/ui/pages/login/login.dart';
import 'package:project/ui/pages/support/create_report.dart';
import 'package:project/ui/pages/support/main_us.dart';
import 'package:project/ui/pages/support/recap_report.dart';
import 'ui/pages/coordinator/main_uc.dart';
import 'ui/pages/coordinator/us_admin/createUS.dart';
import 'ui/pages/coordinator/client_admin/createclient.dart';
import 'ui/pages/coordinator/ratingreportus.dart';
import 'ui/pages/coordinator/ratingreportspecific.dart';
import 'package:project/ui/pages/coordinator/client_admin/client_admin_page.dart';

Future<void> _openBox() async {
  try {
    var dir = await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    Hive.registerAdapter(ReportDBAdapter());

    await Hive.openBox("reportsDB");
    await Hive.openBox("reportsDBOffline");
  } catch (e) {
    logError('Error initializing Hive: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );

  await _openBox();

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your Support Assistance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Login()),
        GetPage(
            name: '/CreateUS',
            page: () => CreateUser(
                  email: '',
                )),
        GetPage(
            name: '/MainPageUC',
            page: () => MainPageUC(
                  email: '',
                )),
        GetPage(name: '/CreateClient', page: () => CreateClient(email: '')),
        GetPage(name: '/Reports', page: () => RatingReportUS(email: '')),
        GetPage(
            name: '/SpecificReport',
            page: () => RatingReport(email: '', id: 0)),
        GetPage(name: '/MainUS', page: () => MainUS()),
        GetPage(name: '/Login', page: () => const Login()),
        GetPage(name: '/CreateReport', page: () => const CreateReport()),
        GetPage(name: '/RecapReport', page: () => const RecapReport()),
        GetPage(name: '/ListSupporters', page: () => ListSupporters(email: '')),
        GetPage(name: '/AdminPageUS', page: () => AdminPageUS(email: '')),
        GetPage(
            name: '/AdminPageClient', page: () => AdminPageClient(email: '')),
        GetPage(name: '/deleteClient', page: () => DeleteClient(email: '')),
        GetPage(name: '/updateClient', page: () => UpdateClient(email: '')),
      ],
      home: const Login(key: Key('MainPage')),
    );
  }
}
