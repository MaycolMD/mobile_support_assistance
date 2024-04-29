import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/controllers/user_support/main_us_controller.dart';

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
              future: _controller.getReports(
                  '', ''), // Espera a que se completen las futuras operaciones
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
                              return CustomRowWidget(
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

Widget CustomRowWidget({
  required BuildContext context,
  required String? id,
}) {
  return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Colors.deepPurple,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed('/RecapReport');
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 24,
                  ),
                  iconSize: 24,
                  padding: EdgeInsets.zero,
                  splashRadius: 24,
                  tooltip: 'Add',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Id Report: $id',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}
