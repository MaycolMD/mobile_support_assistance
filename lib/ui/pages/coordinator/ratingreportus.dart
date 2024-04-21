import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../../../widgets/reportcard.dart';

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
          child: SingleChildScrollView(
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
                ReportCard(
                  reportId: 'Report 1',
                  username: 'US username 1',
                  onPressed: () {
                    Get.toNamed('SpecificReport');
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ReportCard(
                  reportId: 'Report 2',
                  username: 'US username 2',
                  onPressed: () {
                    Navigator.of(context).pushNamed('RatingSpecificReport');
                  },
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
                          vertical:
                              12), // Ajusta el padding según sea necesario
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Borde suavizado
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
      ),
    );
  }
}
