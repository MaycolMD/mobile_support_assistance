import 'package:flutter/material.dart';

Widget buildTextField(
    String label, TextEditingController controller, String hintText,
    {bool isObscureText = false}) {
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
            style: const TextStyle(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 10, 0),
            child: TextFormField(
              controller: controller,
              obscureText: isObscureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0,
                  fontSize: 16,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
              style: const TextStyle(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
