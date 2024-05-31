import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/ui/controllers/coordinator/list_supports_controller.dart';
import 'package:project/ui/pages/coordinator/main_uc.dart';

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
                SizedBox(
                  height: 400,
                  child: Obx(() => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.supports.length,
                        itemBuilder: (context, index) {
                          UserSupport support = controller.supports[index];
                          int countReports = controller.numberOfReports;
                          double avgRating = controller.avgRating;
                          double progress = (avgRating / 5).clamp(0, 1);
                          return Container(
                            width: 350,
                            height: 300,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    support.id.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.person,
                                          size: 24, color: Colors.deepPurple),
                                      const SizedBox(width: 5),
                                      Flexible(
                                        child: Text(
                                          support.name,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.description,
                                          size: 24, color: Colors.deepPurple),
                                      const SizedBox(width: 5),
                                      Flexible(
                                        child: Text(
                                          'Number of Reports: $countReports',
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.grade,
                                          size: 24, color: Colors.deepPurple),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Average Rating: $avgRating',
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.deepPurple),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )),
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
}
