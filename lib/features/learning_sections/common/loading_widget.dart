import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/color_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.color, this.size});

  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: SizedBox(
          height: size, width: size,
          child: CircularProgressIndicator(
            backgroundColor: ColorTheme.onBackground,
            color: color,
            strokeWidth: 8,
            strokeCap: StrokeCap.round,
          )),
    );
  }
}
