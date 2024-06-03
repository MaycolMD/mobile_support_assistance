import 'package:flutter/material.dart';

Widget buildTextField(
  String label,
  TextEditingController controller,
  String hintText, {
  bool isEditable =
      true, // Nuevo parámetro para indicar si el campo es editable o no
  bool isObscureText = false,
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
            style: const TextStyle(
              fontFamily: 'Readex Pro',
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 10, 0),
            child: isEditable
                ? TextFormField(
                    controller: controller,
                    obscureText: isObscureText,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                        fontSize: 16,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                      fontSize: 16,
                    ),
                  )
                : Text(
                    // Si no es editable, mostrar solo el texto
                    hintText,
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
