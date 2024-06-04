import 'package:flutter/material.dart';

Widget buildSubmitButton({
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    key: const Key('ButtonSubmit'),
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all<Color>(Colors.deepPurple), // Color morado
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12), // Ajusta el padding según sea necesario
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Borde suavizado
        ),
      ),
    ),
    child: const Text(
      "Submit",
      style: TextStyle(
          color: Colors.white, fontSize: 30), // Color del texto blanco
    ),
  );
}
