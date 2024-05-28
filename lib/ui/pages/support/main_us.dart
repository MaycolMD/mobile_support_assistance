import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/controllers/user_support/main_us_controller.dart';
import 'package:project/widgets/custom_row.dart';

class MainUS extends StatelessWidget {
  final MainUSController _controller = Get.put(MainUSController());

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
              future: _controller
                  .getAllReports(), // Espera a que se completen las futuras operaciones
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Muestra un indicador de carga mientras se espera
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Expanded(
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
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Text(
                            '[User email address]',
                            style: TextStyle(
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: ElevatedButton(
                            key: const Key('ButtonCreateReport'),
                            onPressed: () {
                              Get.toNamed('/CreateReport');
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.deepPurple),
                            ),
                            child: const Text(
                              'Add Report',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
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
