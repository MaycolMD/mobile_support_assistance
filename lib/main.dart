import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/pages/login/login.dart';
import 'package:project/ui/pages/support/create_report.dart';
import 'package:project/ui/pages/support/main_us.dart';
import 'ui/pages/coordinator/main.dart';
import 'ui/pages/coordinator/createus.dart';
import 'ui/pages/coordinator/createclient.dart';
import 'ui/pages/coordinator/ratingreportus.dart';
import 'ui/pages/coordinator/ratingreportspecific.dart';

void main() {
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
          GetPage(name: '/Reports', page: () => const RatingReportUS()),
          GetPage(name: '/SpecificReport', page: () => const RatingReport()),
          GetPage(name: '/MainUS', page: () => const MainUS()),
          GetPage(name: '/Login', page: () => const Login()),
          GetPage(name: '/CreateReport', page: () => const CreateReport())
        ],
        home: const Login(
          key: Key('MainPage'),
        ));
  }
}
