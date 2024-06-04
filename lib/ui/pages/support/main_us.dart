import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/controllers/connectivity_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/support/create_report.dart';
import 'package:project/ui/pages/support/create_report_offline.dart';
import 'package:project/widgets/custom_row.dart';

import '../../../data/core/network_info.dart';

class MainUS extends StatefulWidget {
  MainUS({super.key, required this.email});
  late String email;

  @override
  _MainUSState createState() => _MainUSState();
}

class _MainUSState extends State<MainUS> {
  final USController _controller = Get.put(USController());
  final ConnectivityController connection = Get.put(ConnectivityController());

  final NetworkInfo networkInfo = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.exit_to_app_outlined,
                      color: Colors.deepPurple,
                      size: 25,
                    ),
                    onPressed: () {
                      Get.offNamed('/Login');
                    },
                  ),
                )
              ],
            ),
            FutureBuilder(
              future: _controller.getAllReportsByEmail(
                  widget.email), // Espera a que se completen las futuras operaciones
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Muestra un indicador de carga mientras se espera
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
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
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Text(
                              'Welcome, ${widget.email}',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 12, 16, 0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _controller.reports.length,
                              itemBuilder: (context, index) {
                                final report = _controller.reports[index];
                                return customRowWidget(
                                  context: context,
                                  id: report.id.toString(),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 50, 0, 0),
                            child: ElevatedButton(
                              key: const Key('ButtonCreateReport'),
                              onPressed: () async {
                                if (await networkInfo.isConnected()) {
                                  Get.to(() => CreateReport(email: widget.email,));
                                } else {
                                  Get.to(() => const CreateReportOffline());
                                }
                              },
                              style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.deepPurple),
                              ),
                              child: const Text(
                                'Add Report',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
