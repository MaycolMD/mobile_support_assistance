import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/report.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/ui/controllers/report/report_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import './../../../widgets/text_field.dart';
import './../../../widgets/back_button.dart';
import './../../../widgets/submit_button.dart';

class RatingReport extends StatefulWidget {
  const RatingReport({Key? key}) : super(key: key);

  @override
  _RatingReportState createState() => _RatingReportState();
}

class _RatingReportState extends State<RatingReport> {
  final _formKey = GlobalKey<FormState>();

  String? email = Get.arguments[0];
  int? id = Get.arguments[1];

  final ReportController _controller = Get.put(ReportController());
  final USController _controllerSupport = Get.put(USController());

  double rating = 3;

  var userIdController = TextEditingController();
  var userDateController = TextEditingController();
  var userStartTimeController = TextEditingController();
  var userEndTimeController = TextEditingController();

  late Report report;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.getReportById(id!),
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
    );
  }

  Widget build2(BuildContext context, Report report) {
    return FutureBuilder(
        future: _controllerSupport.getSupportById(report.supportID),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            UserSupport support = _controllerSupport.support;
            return buildReport(context, report, support.name);
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }));
  }

  Widget buildReport(BuildContext context, Report report, String usName) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50, 20.0, 12.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      Icons.tag_faces_sharp,
                      color: Theme.of(context).colorScheme.background,
                      size: 80,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'REPORT #${id.toString()} FROM ${usName}',
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    height: 44,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: Theme.of(context).dividerColor,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: buildIconTextField(
                      Icons.person,
                      'Client ID',
                      userIdController,
                      report.clientID.toString(),
                      isEditable: false,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: buildIconTextField(
                      Icons.calendar_today,
                      'Date',
                      userDateController,
                      report.date,
                      isEditable: false,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 800,
                    child: buildReadOnlyTextField(
                      'Description',
                      report.description,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: buildIconTextField(
                      Icons.access_time,
                      'Start time',
                      userStartTimeController,
                      report.startTime,
                      isEditable: false,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: buildIconTextField(
                      Icons.access_time,
                      'End time',
                      userEndTimeController,
                      report.endTime,
                      isEditable: false,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rate   ',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontFamily: 'Readex Pro',
                              fontSize: 18,
                            ),
                      ),
                      RatingBar.builder(
                        onRatingUpdate: (newValue) {
                          setState(() {
                            rating = newValue;
                          });
                        },
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        direction: Axis.horizontal,
                        initialRating: rating,
                        itemCount: 5,
                        itemSize: 50,
                        glowColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  buildSubmitButton(onPressed: () {
                    print("$id, ${report.id}");
                    _controller.updateReport(
                        report.id,
                        report.date,
                        rating.toInt(),
                        "Approved",
                        report.endTime,
                        report.startTime,
                        report.clientID,
                        report.description,
                        report.supportID);
                    Get.back();
                  }),
                  const SizedBox(height: 20),
                  buildGoBackButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconTextField(IconData icon, String label,
      TextEditingController controller, String value,
      {required bool isEditable}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.deepPurple,
        ),
        const SizedBox(width: 20),
        buildTextField(label, controller, value, isEditable: isEditable),
      ],
    );
  }

  Widget buildReadOnlyTextField(String label, String value) {
    return TextFormField(
      initialValue: value,
      maxLines: 2,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Readex Pro',
          letterSpacing: 0,
          fontSize: 16,
          color: Theme.of(context).primaryColor,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
      ),
      style: const TextStyle(
        fontFamily: 'Readex Pro',
        letterSpacing: 0,
        fontSize: 16,
      ),
    );
  }
}
