import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSupporters extends StatefulWidget {
  const ListSupporters({super.key});

  @override
  _ListSupportersState createState() => _ListSupportersState();
}

class _ListSupportersState extends State<ListSupporters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 50, 20.0, 12.0),
              child: SingleChildScrollView(
                  child: Column(children: [
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: buildCard(
                        context: context,
                        usID: '[US ID]',
                        usUsername: 'maycolMd',
                        countReports: '2',
                        avgRating: 3.0),
                        );
                      }),
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                ElevatedButton(
                  key: const Key('ButtonGoBack'),
                  onPressed: () {
                    Get.offNamed('/MainPageUC');
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
                )
              ]))),
        ));
  }
}

Widget buildCard({
  required BuildContext context,
  required String usID,
  required String usUsername,
  required String countReports,
  required double avgRating,
}) {
  double progress = (avgRating / 5).clamp(0, 1);
  return Container(
    width: 350,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
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
            usID,
            style: const TextStyle(
              fontFamily: 'Readex Pro',
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
              Icon(Icons.person, size: 24, color: Colors.deepPurple),
              const SizedBox(width: 5),
              Text(
                usUsername,
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 22,
                  color: Colors.black87,
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
              Icon(Icons.description, size: 24, color: Colors.deepPurple),
              const SizedBox(width: 5),
              Text(
                'Number of reports: $countReports',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 22,
                  color: Colors.black87,
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
              Icon(Icons.grade, size: 24, color: Colors.deepPurple),
              const SizedBox(width: 5),
              Text(
                'Average Rating: $avgRating',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 22,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
          ),
        ),
      ],
    ),
  );
}

