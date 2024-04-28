import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildSubmitButton({
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    key: const Key('ButtonSubmit'),
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(Colors.deepPurple), // Color morado
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12), // Ajusta el padding según sea necesario
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
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
