import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/pages/coordinator/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'TextFields & Forms',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPageUC(
          key: Key('MainPage'),
        ));
  }
}
