import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import './../../../widgets/text_field.dart';
import './../../../widgets/back_button.dart';
import './../../../widgets/submit_button.dart';
import './../../controllers/coordinator/ratingreportspecific.controller.dart';

class RatingReport extends StatefulWidget {
  const RatingReport({Key? key}) : super(key: key);

  @override
  _RatingReportState createState() => _RatingReportState();
}

class _RatingReportState extends State<RatingReport> {
  final _formKey = GlobalKey<FormState>();
  String? email = Get.arguments[0];
  final FormControllers _controllers = FormControllers();

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    'REPORT #[ID] FROM [US USERNAME]',
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
                      _controllers.userIdController,
                      '1001883069',
                      isEditable: false,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: buildIconTextField(
                      Icons.calendar_today,
                      'Date',
                      _controllers.userDateController,
                      '15/02/2024',
                      isEditable: false,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 800,
                    child: buildReadOnlyTextField(
                      'Description',
                      'Se observó un aumento significativo en una tendencia creciente en los resultados.',
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: buildIconTextField(
                      Icons.access_time,
                      'Start time',
                      _controllers.userStartTimeController,
                      '6:00 AM',
                      isEditable: false,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: buildIconTextField(
                      Icons.access_time,
                      'End time',
                      _controllers.userEndTimeController,
                      '10:00 PM',
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
                            _controllers.rating = newValue;
                          });
                        },
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        direction: Axis.horizontal,
                        initialRating: _controllers.rating,
                        itemCount: 5,
                        itemSize: 50,
                        glowColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  buildSubmitButton(onPressed: () => Get.back()),
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
