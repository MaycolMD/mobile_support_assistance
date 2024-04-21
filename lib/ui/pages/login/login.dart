import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            //overlay
            width: double.infinity,
            height: 300,
            child: Column(
              // topcolumn
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //container fro icon
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.support_agent,
                    size: 100,
                    color: Colors.deepPurple,
                  ),
                ),
                Padding(
                  //Padding de 12 arriba para el text
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Text('Your Support Assistance',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Column(
              //SignIn
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 16),
                  child: SizedBox(
                    //emailaddress
                    width: double.infinity,
                    child: Material(
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: '[Email address]',
                          labelStyle: TextStyle(
                              fontFamily: 'Readex Pro ', letterSpacing: 0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            //borderRadius: BorderRadius.circular(12,0)
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(
                            fontFamily: 'Readex Pro ', letterSpacing: 0),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  //Password
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      child: TextField(
                        autofillHints: [AutofillHints.password],
                        decoration: InputDecoration(
                          labelText: '[User password]',
                          labelStyle: TextStyle(
                              fontFamily: 'Readex Pro ', letterSpacing: 0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            //borderRadius: BorderRadius.circular(12,0)
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(
                            fontFamily: 'Readex Pro ', letterSpacing: 0),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: 5,)
                Padding(
                  //button
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 20),
                  child: ElevatedButton(
                    key: const Key('ButtonLogin'),
                    onPressed: () {
                      Get.offNamed('/MainUS');
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In US',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  //button
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 20),
                  child: ElevatedButton(
                    key: const Key('ButtonLogin'),
                    onPressed: () {
                      Get.offNamed('/MainPageUC');
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In UC',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
