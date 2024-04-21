import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormControllers extends GetxController {
  double rating = 3;

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController userDateController = TextEditingController();
  final TextEditingController userStartTimeController = TextEditingController();
  final TextEditingController userEndTimeController = TextEditingController();
}
