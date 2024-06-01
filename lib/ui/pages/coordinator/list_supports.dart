import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/ui/controllers/coordinator/list_supports_controller.dart';
import 'package:project/ui/pages/coordinator/main_uc.dart';
import 'package:project/widgets/reportcardsupport.dart';

class ListSupporters extends StatefulWidget {
  const ListSupporters({super.key});

  @override
  _ListSupportersState createState() => _ListSupportersState();
}

class _ListSupportersState extends State<ListSupporters> {
  ListSupportsController controller = Get.put(ListSupportsController());
  String? email = Get.arguments[0];

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
                  return FutureBuilder(
                      future: controller.getSupports(),
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
                }),
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

  Column generateSupportsCards() {
    int size = controller.supports.length;
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
                final support = controller.supports[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 400,
                    child: ReportCardSupport(
                      supportId: support.id.toString(),
                      username: support.name.toString(),
                      numReports: 6,
                      rating: 4,
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
