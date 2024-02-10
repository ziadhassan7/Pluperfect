import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/color_theme.dart';

class SpeakingAnimation extends StatelessWidget {
  const SpeakingAnimation({super.key, this.size = 120, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return button('assets/animations/speak.json', true);
  }

  Widget button(String icon, bool shouldAnimate){
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color ?? ColorTheme.text,
        BlendMode.modulate, //Original Color has to be WHITE
      ),

      child: Lottie.asset(
        icon,
        height: size, width: size, fit: BoxFit.fill,
        animate: shouldAnimate,
        frameRate: FrameRate.max,

        delegates: LottieDelegates(
          values: [
            ValueDelegate.color(
              const ['**'],
              value: black,
            ),
          ],
        ),

      ),
    );
  }
}
