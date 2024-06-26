import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildGoBackButton() {
  return OutlinedButton(
    key: const Key('ButtonGoBack'),
    onPressed: () {
      Get.back();
    },
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      side: WidgetStateProperty.all<BorderSide>(
        const BorderSide(
          color: Colors.deepPurple, // Borde morado
          width: 2, // Ancho del borde
        ),
      ),
    ),
    child: const Text(
      "Go Back",
      style: TextStyle(
        color: Colors.deepPurple, // Color del texto morado
        fontSize: 20,
      ),
    ),
  );
}
