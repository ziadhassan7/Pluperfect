import 'package:flutter/material.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';

class DecorationContainer extends StatelessWidget {
  const DecorationContainer({super.key, required this.child,});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const CustomPadding(top: 20, horizontal: 20, bottom: 10),
      decoration: CustomDecoration(
          backgroundColor: ColorTheme.onBackground,
          radius: 30,
          borderColor: greyOpacity30,
          borderWidth: 2
      ),

      child: child,
    );
  }

}
