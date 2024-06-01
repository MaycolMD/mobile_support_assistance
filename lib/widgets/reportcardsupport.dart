import 'package:flutter/material.dart';

class ReportCardSupport extends StatelessWidget {
  final String supportId;
  final String username;
  final int numReports;
  final int rating;

  const ReportCardSupport(
      {Key? key,
      required this.supportId,
      required this.username,
      required this.numReports,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 300,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              supportId,
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
                const Icon(Icons.person, size: 24, color: Colors.deepPurple),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    username,
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
                    'Number of Reports: $numReports',
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
                const Icon(Icons.grade, size: 24, color: Colors.deepPurple),
                const SizedBox(width: 5),
                Text(
                  'Average Rating: $rating',
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LinearProgressIndicator(
              value: rating.toDouble(),
              backgroundColor: Colors.grey[300],
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
