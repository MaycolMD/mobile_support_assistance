import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/data/core/network_info.dart';
import 'package:project/ui/controllers/report/offline_report_controller.dart';
import 'package:project/ui/pages/support/main_us_offline.dart';
import 'package:project/widgets/text_field.dart';

class CreateReportOffline extends StatefulWidget {
  const CreateReportOffline({super.key});

  @override
  _CreateReportState createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReportOffline> {
  String email = Get.arguments[0];
  final ReportControllerOffline controller = Get.put(ReportControllerOffline());

  var clientName = TextEditingController();
  var clientID = TextEditingController();
  var supportID = TextEditingController();

  var descriptionController = TextEditingController();

  var network = Get.put(NetworkInfo());

  @override
  void initState() {
    super.initState();
  }

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
                actions: const [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                        child: Text(
                          'Create a new report',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          SizedBox(
                            //Client container
                            width: 350,
                            child: buildTextField(
                                'Client', clientName, 'Enter Name'),
                          )
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          SizedBox(
                            //Client container
                            width: 350,
                            child: buildTextField(
                                'Client ID', clientID, 'Enter Client ID'),
                          )
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          SizedBox(
                            //Client container
                            width: 350,
                            child: buildTextField(
                                'Support ID', supportID, 'Enter Support ID'),
                          )
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          SizedBox(
                            //Client container
                            width: 350,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Date  ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                buildDateSelector(
                                    context: context,
                                    label: 'Date',
                                    selectedDate: controller.selectedDate,
                                    onPressed: () async {
                                      final pickedDate =
                                          await controller.selectDate(context);
                                      if (pickedDate != null) {
                                        setState(() {
                                          controller.selectedDate = pickedDate;
                                        });
                                      }
                                    }),
                              ],
                            ),
                          )
                        ])),
                    const SizedBox(height: 15),
                    SizedBox(
                        width: 350,
                        child: TextField(
                          controller: descriptionController,
                          textCapitalization: TextCapitalization.words,
                          //autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Description about your support',
                            hintStyle: const TextStyle(
                                fontFamily: 'Readex Pro', letterSpacing: 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            //filled: true,
                            //fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                          ),
                          cursorColor: Colors.deepPurple,
                          maxLines: 5,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          SizedBox(
                            //Client container
                            width: 356,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Start Time',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                buildTimeSelector(
                                  context: context,
                                  label: 'Start Time',
                                  selectedTime: controller.selectedTimeStart,
                                  onPressed: () async {
                                    final pickedTime = await controller
                                        .selectTime(context, true);
                                    if (pickedTime != null) {
                                      setState(() {
                                        controller.selectedTimeStart =
                                            pickedTime;
                                      });
                                    }
                                  },
                                  selectTime: controller.selectTime,
                                ),
                              ],
                            ),
                          )
                        ])),
                    const SizedBox(height: 10),
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          SizedBox(
                            //Client container
                            width: 356,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'End Time  ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                buildTimeSelector(
                                  context: context,
                                  label: 'End Time',
                                  selectedTime: controller.selectedTimeEnd,
                                  onPressed: () async {
                                    final pickedTime = await controller
                                        .selectTime(context, false);
                                    if (pickedTime != null) {
                                      setState(() {
                                        controller.selectedTimeEnd = pickedTime;
                                      });
                                    }
                                  },
                                  selectTime: controller.selectTime,
                                ),
                              ],
                            ),
                          )
                        ])),
                    const SizedBox(height: 10),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: ElevatedButton(
                          key: const Key('ButtonSubmitReportUS'),
                          onPressed: () async {
                            DateTime dateFormatted = DateTime(
                                controller.selectedDate!.year,
                                controller.selectedDate!.month,
                                controller.selectedDate!.day);
                            await controller.addReportHive(
                                "${dateFormatted.year}-${dateFormatted.month.toString().padLeft(2, '0')}-${dateFormatted.day.toString().padLeft(2, '0')}",
                                0,
                                "Pending",
                                controller.selectedTimeEnd!.format(context),
                                controller.selectedTimeStart!.format(context),
                                controller.selectedClient.toString(),
                                descriptionController.text.toString(),
                                email,
                                int.parse(clientID.text),
                                int.parse(supportID.text));
                            descriptionController
                                .clear(); // Borrar el contenido del campo de descripción
                            controller.selectedClient =
                                ''; // Reiniciar la selección de cliente
                            controller.selectedDate =
                                null; // Reiniciar la fecha seleccionada
                            controller.selectedTimeStart =
                                null; // Reiniciar la hora de inicio seleccionada
                            controller.selectedTimeEnd =
                                null; // Reiniciar la hora de finalización seleccionada
                            Get.to(() => const MainReportsOffline());
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.deepPurple),
                          ),
                          child: const Text('Submit',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildDateSelector({
  required BuildContext context,
  required String label,
  required DateTime? selectedDate,
  required VoidCallback onPressed,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDate != null
                    ? DateFormat('dd-MM-yyyy').format(selectedDate)
                    : 'Select Date',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  letterSpacing: 0,
                  fontSize: 16,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildTimeSelector({
  required BuildContext context,
  required String label,
  required TimeOfDay? selectedTime,
  required VoidCallback onPressed,
  required Future<TimeOfDay?> Function(BuildContext, bool) selectTime,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedTime != null
                    ? selectedTime.format(context)
                    : 'Select Time',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  letterSpacing: 0,
                  fontSize: 16,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.access_time),
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget dropBoxSelector({
  required BuildContext context,
  required String? value,
  required List<String> items, // Cambiado para recibir una lista directamente
  required Function(String?) onChanged,
  required String hintText,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: DropdownButton<String>(
            value: value,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    ),
  );
}
