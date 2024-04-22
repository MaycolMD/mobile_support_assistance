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
                Row(
                  children: [
                    buildCard(
                        context: context,
                        usID: '[US ID]',
                        usUsername: 'maycolMd',
                        countReports: '2',
                        avgRating: 3.0),
                    buildCard(
                        context: context,
                        usID: '[US ID]',
                        usUsername: 'maycolMd',
                        countReports: '2',
                        avgRating: 3.0)
                  ],
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
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
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
              letterSpacing: 0,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
            child: Row(children: [
          Icon(Icons.person),
          SizedBox(
            height: 10,
          ),
          Text(
            usUsername,
            style: const TextStyle(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
              fontSize: 20,
            ),
          )
        ])),
        const SizedBox(height: 16),
        Center(
            child: Text(
          'Number of reports: $countReports',
          style: const TextStyle(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
            fontSize: 20,
          ),
        )),
        const SizedBox(height: 16),
        Container(
          child: Center(
              child: Column(children: [
            Text(
              'Average Rating: $avgRating',
              style: const TextStyle(
                  fontFamily: 'Readex Pro', letterSpacing: 0, fontSize: 20),
            ),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            )
          ])),
        )
      ],
    ),
  );
}
