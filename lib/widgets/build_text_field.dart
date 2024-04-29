import 'package:flutter/material.dart';

Widget buildTextField(
    {required BuildContext context,
    required String label,
    required String hintText,
    bool isObscureText = false}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 0, 0),
                  child: Text(
                    hintText,
                    style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    ),
  );
}