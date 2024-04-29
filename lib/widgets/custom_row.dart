
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customRowWidget({
  required BuildContext context,
  required String? id,
}) {
  return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Colors.deepPurple,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed('/RecapReport');
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 24,
                  ),
                  iconSize: 24,
                  padding: EdgeInsets.zero,
                  splashRadius: 24,
                  tooltip: 'Add',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Id Report: $id',
                  textAlign: TextAlign.center,
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
      ));
}