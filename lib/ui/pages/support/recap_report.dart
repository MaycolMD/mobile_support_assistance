import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/ui/controllers/report/report_controller.dart';
import 'package:project/widgets/build_text_field.dart';

class RecapReport extends StatefulWidget {
  const RecapReport({super.key});

  @override
  _RecapReportState createState() => _RecapReportState();
}

class _RecapReportState extends State<RecapReport> {
  final ReportController _controller = Get.put(ReportController());
  final int _number = int.parse(Get.arguments[0]); //
  late Report report;
  late String clientName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: _controller.getReportById(_number),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              report = _controller.report;
              return build2(context, report);
            } else {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ));
  }

  @override
  Widget build2(BuildContext context, Report report) {
    return FutureBuilder(
        future: _controller.getClientNameOnReport(report.clientID),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            clientName = _controller.selectedClient.toString();
            return RecapReport(context, report, clientName);
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }));
  }

  @override
  Widget RecapReport(BuildContext context, Report report, String clientName) {
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
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                        child: Text(
                          'REPORT #$_number',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
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
                                hintText: report.status),
                            const SizedBox(
                              height: 10,
                            ),
                            buildTextField(
                                context: context,
                                label: 'Client ',
                                hintText: clientName),
                            const SizedBox(height: 10),
                            buildTextField(
                                context: context,
                                label: 'Date   ',
                                hintText: report.date),
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
                              child: SingleChildScrollView(
                                // Para que la información sea scrollable si es muy larga
                                child: Text(
                                  report.description, // Texto a mostrar
                                  style: const TextStyle(
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
                                hintText: report.startTime),
                            const SizedBox(
                              height: 10,
                            ),
                            buildTextField(
                                context: context,
                                label: 'End Time  ',
                                hintText: report.endTime),
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
                                      color: i < report.rating
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
