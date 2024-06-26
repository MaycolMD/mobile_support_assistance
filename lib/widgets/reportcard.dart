import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String reportId;
  final String username;
  final String date;
  final String status;
  final VoidCallback onPressed;

  const ReportCard({
    super.key,
    required this.reportId,
    required this.username,
    required this.date,
    required this.status,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ID REPORT - $reportId',
            style: const TextStyle(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'US ID: $username',
            style: const TextStyle(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Date: $date',
            style: const TextStyle(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Status: $status',
            style: const TextStyle(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            key: Key('reviewButton$reportId'),
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).primaryColor,
              ),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return Colors.grey.withOpacity(0.5);
                  }
                  return null;
                },
              ),
            ),
            child: const Text(
              'Review',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
