import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project/data/datasources/remote/client_datasource.dart';
import 'package:project/data/datasources/remote/interfaces/I_client_datasource.dart';
import 'package:project/data/datasources/remote/interfaces/I_report_datasource.dart';
import 'package:project/data/datasources/remote/interfaces/I_support_datasource.dart';
import 'package:project/data/datasources/remote/report_datasource.dart';
import 'package:project/data/datasources/remote/support_datasource.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/repositories/client_repository.dart';
import 'package:project/domain/repositories/interfaces/I_client_repository.dart';
import 'package:project/domain/repositories/interfaces/I_report_repository.dart';
import 'package:project/domain/repositories/interfaces/I_support_repository.dart';
import 'package:project/domain/repositories/report_repository.dart';
import 'package:project/domain/repositories/support_repository.dart';
import 'package:project/domain/use_case/client_usecase.dart';
import 'package:project/domain/use_case/report_usecase.dart';
import 'package:project/domain/use_case/us_usecase.dart';
import 'package:project/ui/controllers/login_controller.dart';
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

void main() async {
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

  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(ReportAdapter()); // No olvides generar el adaptador
  // await Hive.openBox<Report>('reports');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          GetPage(name: '/CreateUS', page: () => const CreateUser()),
          GetPage(name: '/MainPageUC', page: () => const MainPageUC()),
          GetPage(name: '/CreateClient', page: () => const CreateClient()),
          GetPage(name: '/Reports', page: () => RatingReportUS()),
          GetPage(name: '/SpecificReport', page: () => const RatingReport()),
          GetPage(name: '/MainUS', page: () => MainUS()),
          GetPage(name: '/Login', page: () => const Login()),
          GetPage(name: '/CreateReport', page: () => const CreateReport()),
          GetPage(name: '/RecapReport', page: () => const RecapReport()),
          GetPage(name: '/ListSupporters', page: () => const ListSupporters()),
          GetPage(name: '/AdminPageUS', page: () => const AdminPageUS()),
          GetPage(
              name: '/AdminPageClient', page: () => const AdminPageClient()),
          GetPage(name: '/deleteClient', page: () => const DeleteClient()),
          GetPage(name: '/updateClient', page: () => const UpdateClient()),
        ],
        home: const Login(
          key: Key('MainPage'),
        ));
  }
}
