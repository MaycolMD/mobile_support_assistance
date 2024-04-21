import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String reportId;
  final String username;
  final VoidCallback onPressed;

  const ReportCard({
    Key? key,
    required this.reportId,
    required this.username,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ID $reportId',
          style: const TextStyle(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          username,
          style: const TextStyle(
            fontFamily: 'Readex Pro',
            letterSpacing: 0,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Opacity(
          opacity: 0.9,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor,
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
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
    );
  }
}
