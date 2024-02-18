import 'package:flutter/material.dart';
import '../../../core/localization/localization.dart';
import '../../../core/styles/color_theme.dart';
import 'context_menu/context_menu.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //close any context menu opened
          ContextMenu.close();
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close_rounded,
          semanticLabel: LocalTxt.closeButton, color: ColorTheme.text, size: 28,)
    );
  }
}
