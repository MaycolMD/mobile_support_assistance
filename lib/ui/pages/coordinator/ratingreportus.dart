import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/coordinator/main_uc.dart';
import 'package:project/ui/pages/coordinator/ratingreportspecific.dart';
import './../../../widgets/reportcard.dart';
import './../../controllers/coordinator/ratingreportus.controller.dart';

class RatingReportUS extends StatelessWidget {
  final RatingReportUSController controller =
      Get.put(RatingReportUSController());
  final USController _controller = Get.put(USController());

  String? email = Get.arguments[0];
  RatingReportUS({Key? key}) : super(key: key);

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
                Obx(() {
                  if (controller.shouldRefresh.value) {
                    return FutureBuilder(
                        future: controller.getAllReports(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Center(
                              child: SizedBox(
                                height: 400,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: generateReportsCards(),
                                ),
                              ),
                            );
                          }
                        });
                  } else {
                    return Center(
                      child: SizedBox(
                        height: 400,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: generateReportsCards(),
                        ),
                      ),
                    );
                  }
                }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: controller.selectClient,
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      child: Obx(() => Text(controller.selectedClient.value)),
                    ),
                    TextButton(
                      onPressed: controller.selectSupport,
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      child: Obx(() => Text(controller.selectedSupport.value)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  key: const Key('ButtonGoBack'),
                  onPressed: () {
                    Get.to(() => MainPageUC(), arguments: [email]);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepPurple,
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Go to main",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column generateReportsCards() {
    int size = controller.reports.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        (size / 3).ceil(),
        (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (colIndex) {
              final index = rowIndex * 3 + colIndex;
              if (index < size) {
                final report = controller.reports[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 400,
                    child: ReportCard(
                      reportId: report.id.toString(),
                      username: report.supportID.toString(),
                      date: report.date,
                      status: report.status,
                      onPressed: () {
                        Get.to(() => RatingReport(),
                            arguments: [email, report.id]);
                      },
                    ),
                  ),
                );
              } else {
                return const SizedBox(); // Si no hay más elementos, devuelve un SizedBox
              }
            }),
          );
        },
      ),
    );
  }
}
