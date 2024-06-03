import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/controllers/connectivity_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/support/create_report.dart';
import 'package:project/ui/pages/support/create_report_offline.dart';
import 'package:project/widgets/custom_row.dart';

import '../../../data/core/network_info.dart';
import '../login/login.dart';

class MainReportsOffline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          key: const Key('ButtonCreateReport'),
          children: [
            const Card(
              color: Colors.deepPurple,
              child: Icon(
                Icons.tag_faces_sharp,
                size: 80,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Text(
                'Welcome, Soporte de Usuario',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 44,
              thickness: 2,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                Get.to(() => const CreateReportOffline(),
                    arguments: ['Usuario']);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              child: const Text(
                'Add Report',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                Get.offNamed('/Login');
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              child: const Text(
                'Ya tengo internet',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
