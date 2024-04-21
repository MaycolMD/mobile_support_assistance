import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingReportUS extends StatefulWidget {
  const RatingReportUS({super.key});

  @override
  _RatingReportUSState createState() => _RatingReportUSState();
}

class _RatingReportUSState extends State<RatingReportUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50, 20.0, 12.0),
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
                'REPORTS',
                style: TextStyle(fontSize: 40),
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
                height: 50,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ID Report 1',
                    style: TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'US username 1',
                    style: TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: TextButton(
                      onPressed: () async {
                        Get.toNamed('SpecificReport');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor,
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 0),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(1),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Review',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250, // Ajusta este valor según sea necesario
                    child: Divider(
                      thickness: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ID Report 2',
                    style: TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'US username 2',
                    style: TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: TextButton(
                      onPressed: () async {
                        Navigator.of(context).pushNamed('RatingSpecificReport');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor,
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 0),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(1),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Review',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250, // Ajusta este valor según sea necesario
                    child: Divider(
                      thickness: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                key: const Key('ButtonGoBack'),
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.purple), // Color morado
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12), // Ajusta el padding según sea necesario
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Borde suavizado
                    ),
                  ),
                ),
                child: const Text(
                  "Go to main",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25), // Color del texto blanco
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
