import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pluperfect/core/styles/padding.dart';

class ThinkingAnimation extends StatelessWidget {
  const ThinkingAnimation({super.key, this.size = 300, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 120),
      child: LoadingAnimationWidget.waveDots(
        color: color,
        size: 140,
      ),
    );
  }
}
