import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50, 20.0, 12.0),
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
                  'NEW USER REPORT',
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'US_ID',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final _datePicked1Date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme: const ColorScheme.light(
                                        primary: Colors
                                            .blue), // Cambia este color según sea necesario // Cambia este color según sea necesario
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            // if (_datePicked1Date != null) {
                            //   safeSetState(() {
                            //     _model.datePicked1 = DateTime(
                            //       _datePicked1Date.year,
                            //       _datePicked1Date.month,
                            //       _datePicked1Date.day,
                            //     );
                            //   });
                            // }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48,
                            constraints: const BoxConstraints(
                              minWidth: 100,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).secondaryHeaderColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: const Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  key: const Key('ButtonSignUpSubmit'),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final form = _formKey.currentState;
                    form!.save();
                    if (form.validate()) {
                      // Handle form submission
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Validation nok'),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomCard(String title, String? routeName, IconData icon) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).secondaryHeaderColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 30,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                icon,
                size: 24,
                color: Colors.purple,
              ),
              onPressed: () {
                if (routeName != null) {
                  Get.toNamed(routeName);
                } else {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                }
              },
            ),
            if (_isExpanded && routeName == null)
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'More information here',
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
