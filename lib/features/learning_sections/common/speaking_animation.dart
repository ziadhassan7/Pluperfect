import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SpeakingAnimation extends StatelessWidget {
  const SpeakingAnimation({super.key, this.size = 120, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return button('assets/animations/speak.json', true);
  }

  Widget button(String icon, bool shouldAnimate){
    return Lottie.asset(
      icon,
      height: size, width: size, fit: BoxFit.fill,
      animate: shouldAnimate,
      frameRate: FrameRate.max,

      delegates: LottieDelegates(
        values: [
          ValueDelegate.color(
            const ['**'],
            value: color,
          ),
        ],
      ),

    );
  }
}
