import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecapReport extends StatefulWidget {
  const RecapReport({super.key});

  @override
  _RecapReportState createState() => _RecapReportState();
}

class _RecapReportState extends State<RecapReport> {
  final int _number = 4; // Con un get hay que tomar el rate que le dieron
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: AppBar(
                toolbarHeight: 30,
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                        child: Text(
                          '[ID] report',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.deepPurple,
                            size: 25,
                          ),
                          onPressed: () {
                            Get.toNamed('MainUS');
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 20),
              child: SingleChildScrollView(
                  child: SizedBox(
                      width: 350,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildTextField(
                                context: context,
                                label: 'Status',
                                hintText: 'Status report'),
                            const SizedBox(
                              height: 10,
                            ),
                            buildTextField(
                                context: context,
                                label: 'Client ',
                                hintText: 'Client username'),
                            const SizedBox(height: 10),
                            buildTextField(
                                context: context,
                                label: 'Date   ',
                                hintText: "Support's date"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 100,
                              width: double
                                  .infinity, // Establece la altura deseada
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // Color del borde
                                  width: 2, // Ancho del borde
                                ),
                                borderRadius: BorderRadius.circular(
                                    12), // Borde redondeado
                              ),
                              padding:
                                  const EdgeInsets.all(10), // Espaciado interno
                              child: const SingleChildScrollView(
                                // Para que la información sea scrollable si es muy larga
                                child: Text(
                                  'Description from supporter', // Texto a mostrar
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            buildTextField(
                                context: context,
                                label: 'Start Time',
                                hintText: 'Start Time'),
                            const SizedBox(
                              height: 10,
                            ),
                            buildTextField(
                                context: context,
                                label: 'End Time  ',
                                hintText: 'End Time'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Rate',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Lista de iconos para mostrar las estrellas
                                  for (int i = 0; i < 5; i++)
                                    Icon(
                                      Icons.star_rounded,
                                      color: i < _number
                                          ? Colors.deepPurple
                                          : Colors.grey,
                                      size: 30,
                                    ),
                                ],
                              ),
                            )
                          ]))),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(
    {required BuildContext context,
    required String label,
    required String hintText,
    bool isObscureText = false}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 0, 0),
                  child: Text(
                    hintText,
                    style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    ),
  );
}
