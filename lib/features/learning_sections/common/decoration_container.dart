import 'package:flutter/material.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';

class DecorationContainer extends StatelessWidget {
  const DecorationContainer({
    super.key,
    this.padding,
    required this.child,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const CustomPadding(vertical: 20, horizontal: 20,),
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
