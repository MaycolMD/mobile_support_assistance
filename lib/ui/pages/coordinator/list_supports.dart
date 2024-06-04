import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/controllers/report/report_controller.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/coordinator/main_uc.dart';
import 'package:project/widgets/reportcardsupport.dart';


class ListSupporters extends StatefulWidget {
  ListSupporters({super.key, required this.email});
  late String email;

  @override
  _ListSupportersState createState() => _ListSupportersState();
}

class _ListSupportersState extends State<ListSupporters> {

  var clientController = TextEditingController();
  var supportController = TextEditingController();

  final RxBool shouldRefresh = true.obs;
  final ReportController _reportController = Get.put(ReportController());
  final USController _controller = Get.put(USController());

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
                      color: Theme.of(context).colorScheme.surface,
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'OUR PARTNERS',
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
                const SizedBox(height: 10),
                Obx(() {
                  if (shouldRefresh.value) {
                    return FutureBuilder(
                        future: _controller.getSupportActive(),
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
                                  child: generateSupportsCards(),
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
                          child: generateSupportsCards(),
                        ),
                      ),
                    );
                  }
                }),
                const SizedBox(height: 20),
                ElevatedButton(
                  key: const Key('ButtonGoBack'),
                  onPressed: () {
                    Get.to(() => MainPageUC(email: widget.email));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.deepPurple,
                    ),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    shape: WidgetStateProperty.all<OutlinedBorder>(
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

  Column generateSupportsCards() {
    int size = _controller.supports.length;
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
                final support = _controller.supports[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 400,
                    child: FutureBuilder<List<int>>(
                      future: Future.wait([
                        _reportController
                            .getNumberOfReportsBySupportID(support.id!),
                        _reportController.getAvgRating(support.id!),
                      ]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // Asegurando que los valores sean del tipo correcto
                          final numReports = snapshot.data?[0] ?? 0;
                          final rating = snapshot.data?[1] ?? 0;
                          return ReportCardSupport(
                            supportId: support.id.toString(),
                            username: support.name.toString(),
                            numReports: numReports.isNaN ? 0 : numReports,
                            rating: rating.isNaN ? 0 : rating,
                          );
                        }
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
