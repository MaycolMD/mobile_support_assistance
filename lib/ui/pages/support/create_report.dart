import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/ui/controllers/user_support/create_report_controller.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({super.key});

  @override
  _CreateReportState createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  final CreateReportController controller = Get.put(CreateReportController());
  String client = "";

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
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
                            Get.toNamed('/MainUS');
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Client',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                dropBoxSelector(
                                    context: context,
                                    label: controller.selectedClient,
                                    hintText: 'Select a client',
                                    itemsFuture: controller.getClientsName(),
                                    onChanged: (newValue) => {
                                          setState(() {
                                            controller.selectedClient =
                                                newValue;
                                          })
                                        })
                              ],
                            ),
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
                        child: TextFormField(
                          controller: TextEditingController(),
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
                          const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: ElevatedButton(
                          key: const Key('ButtonSubmitReportUS'),
                          onPressed: () async {
                            await controller.addReport((controller.selectedDate).toString(),
                                0,
                                "Pending",
                                    (controller.selectedTimeEnd).toString(),
                                
                                    (controller.selectedTimeStart).toString(),
                                 1,
                                    controller.descriptionController.text,
                                1);
                            controller.descriptionController
                                .clear(); // Borrar el contenido del campo de descripción
                            controller
                                .selectedClient; // Reiniciar la selección de cliente
                            controller.selectedDate =
                                null; // Reiniciar la fecha seleccionada
                            controller.selectedTimeStart =
                                null; // Reiniciar la hora de inicio seleccionada
                            controller.selectedTimeEnd =
                                null; // Reiniciar la hora de finalización seleccionada
                            Get.toNamed('/MainUS');
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.deepPurple),
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
  required String? label,
  required Future<List<String>> itemsFuture,
  required Function(String?) onChanged,
  required String hintText,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
      child: FutureBuilder<List<String>>(
        future: itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras los datos están siendo cargados
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Si hay un error al cargar los datos
            return Text('Error: ${snapshot.error}');
          } else {
            // Cuando los datos están disponibles
            List<String> items = snapshot.data!;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: DropdownButtonFormField<String>(
                  value: label,
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  decoration: InputDecoration(
                    hintText: hintText,
                    labelStyle: const TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.black,
                      letterSpacing: 0,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: onChanged,
                ),
              ),
            );
          }
        },
      ),
    ),
  );
}
