import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainUS extends StatefulWidget {
  const MainUS({super.key});

  @override
  _MainUSState createState() => _MainUSState();
}

class _MainUSState extends State<MainUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  //iconbuttonsalir
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.exit_to_app_outlined,
                      color: Colors.deepPurple,
                      size: 25,
                    ),
                    onPressed: () {
                      Get.offNamed('Login');
                    },
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  color: Colors.deepPurple,
                  child: Icon(
                    Icons.tag_faces_sharp,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Text('[User email address]',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none)),
                ),
                Divider(
                  color: Colors.grey,
                  height: 44,
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: const [
                      CustomRowWidget(),
                      CustomRowWidget(),
                      CustomRowWidget()
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: ElevatedButton(
                  key: Key('ButtonCreateReport'),
                  onPressed: () {
                    Get.toNamed('CreateReport');
                  },
                  child: Text('Add Report',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.deepPurple),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    color: Colors.deepPurple,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Id Report',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
