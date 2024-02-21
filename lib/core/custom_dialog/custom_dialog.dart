import 'package:flutter/material.dart';
import 'package:modern_dialog/modern_dialog.dart';
import 'package:pluperfect/core/styles/color_theme.dart';

class CustomDialog {
  BuildContext context;
  Widget view;

  CustomDialog(
      this.context, {required this.view,}) {
    // Decide dialog layout based on platform

    ModernDialog.showCustom(
        context,

        borderRadius: 25,
        disablePadding: true,
        disableTintColor: true,
        backgroundColor: ColorTheme.background,

        view: view
    );
  }
}
