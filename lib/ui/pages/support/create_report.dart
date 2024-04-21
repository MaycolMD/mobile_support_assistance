import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/ui/controllers/user_support/create_report_controller.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({super.key});

  @override
  _CreateReportState createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  final CreateReportController controller = Get.put(CreateReportController());
/*
  String? _selectedClient;
  List<String> _clientList = ['Client1', 'Client2', 'ClientN'];
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime1;
  TimeOfDay? _selectedTime2;
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: AppBar(
                toolbarHeight: 30,
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: IconButton(
                          icon: Icon(
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          Container(
                            //Client container
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
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
                                    items: controller.clientList,
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          Container(
                            //Client container
                            width: 356,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Date',
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
                    SizedBox(height: 15),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      //autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Description about your support',
                        labelStyle: TextStyle(
                            fontFamily: 'Readex Pro', letterSpacing: 0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        //filled: true,
                        //fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      ),
                      cursorColor: Colors.deepPurple,
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          Container(
                            //Client container
                            width: 356,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
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
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(children: [
                          Container(
                            //Client container
                            width: 356,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'End Time',
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
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: ElevatedButton(
                          key: Key('ButtonSubmitReportUS'),
                          onPressed: () {
                            //GUARDAR TODO EN LOCAL Y LUEGO SE BORRA TODO
                            controller.descriptionController
                                .clear(); // Borrar el contenido del campo de descripción
                            controller.selectedClient =
                                null; // Reiniciar la selección de cliente
                            controller.selectedDate =
                                null; // Reiniciar la fecha seleccionada
                            controller.selectedTimeStart =
                                null; // Reiniciar la hora de inicio seleccionada
                            controller.selectedTimeEnd =
                                null; // Reiniciar la hora de finalización seleccionada
                            Get.toNamed('/MainUS');
                          },
                          child: Text('Submit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.deepPurple),
                          )),
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
                icon: Icon(Icons.calendar_month),
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
                icon: Icon(Icons.access_time),
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget dropBoxSelector(
    {required BuildContext context,
    required String? label,
    required List<String> items,
    required Function(String?) onChanged,
    required String hintText}) {
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
                  labelStyle: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.black,
                    letterSpacing: 0,
                    fontSize: 16,
                  )),
              onChanged: onChanged,
            ),
          )));
}
