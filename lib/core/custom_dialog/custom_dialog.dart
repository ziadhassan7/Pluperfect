import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomUhh {
  BuildContext context;
  Widget view;

  CustomUhh(
      this.context, {
        required this.view,
      }) {
    // Decide dialog layout based on platform
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            surfaceTintColor: white,
            backgroundColor: white,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),

            /// Child Content Widget
            content: SingleChildScrollView(child: view),
          );
        });
  }
}
