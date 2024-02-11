import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key, this.size = 300, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return button('assets/animations/loading.json', true);
  }

  Widget button(String icon, bool shouldAnimate){
    return Lottie.asset(
      icon,
      height: size, width: size, fit: BoxFit.fill,
      animate: shouldAnimate,
      frameRate: FrameRate.max,
    );
  }
}
