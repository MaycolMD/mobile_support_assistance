import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildDateSelector({
  required BuildContext context,
  required String label,
  required DateTime? selectedDate,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: 800,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100, // Ancho fijo para el texto a la izquierda
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0,
                ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(70, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(selectedDate)
                      : 'Select Date',
                  style: const TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.black,
                    letterSpacing: 0,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
