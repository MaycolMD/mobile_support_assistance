import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import './../../../widgets/text_field.dart';
import './../../../widgets/back_button.dart';
import './../../../widgets/submit_button.dart';

class RatingReport extends StatefulWidget {
  const RatingReport({super.key});

  @override
  _RatingReportState createState() => _RatingReportState();
}

class _RatingReportState extends State<RatingReport> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 3;

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _userDateController = TextEditingController();
  final TextEditingController _userStartTimeController =
      TextEditingController();
  final TextEditingController _userEndTimeController = TextEditingController();

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
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          Icons.tag_faces_sharp,
                          color: Theme.of(context).colorScheme.background,
                          size: 80,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'REPORT #[ID] FROM [US USERNAME]',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 44,
                      thickness: 1,
                      indent: 24,
                      endIndent: 24,
                      color: Theme.of(context).dividerColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                      'Client ID',
                      _userIdController,
                      '1001883069',
                      isEditable: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                      'Date',
                      _userDateController,
                      '15/02/2024',
                      isEditable: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 800,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 10, 0),
                              child: TextFormField(
                                readOnly: true,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  hintText:
                                      'Se observó un aumento significativo en una tendencia creciente en los resultados.',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                    fontSize: 16,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 40, horizontal: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                    ),
                                  ),
                                ),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                      'Start time',
                      _userStartTimeController,
                      '6:00 AM',
                      isEditable: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                      'End time',
                      _userEndTimeController,
                      '10:00 PM',
                      isEditable: false,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 800,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rate   ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                    fontSize: 18),
                          ),
                          RatingBar.builder(
                            onRatingUpdate: (newValue) {
                              setState(() {
                                _rating =
                                    newValue; // Actualiza el valor del rating cuando cambia
                              });
                            },
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            direction: Axis.horizontal,
                            initialRating:
                                _rating, // Utiliza el valor del rating definido
                            itemCount: 5,
                            itemSize: 50,
                            glowColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    buildSubmitButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildGoBackButton(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
