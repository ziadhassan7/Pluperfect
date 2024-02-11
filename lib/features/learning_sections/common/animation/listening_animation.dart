import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListeningAnimation extends StatelessWidget {
  const ListeningAnimation({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return button('assets/animations/listen.json', true);
  }


  Widget button(String icon, bool shouldAnimate) {
    return Lottie.asset(
      icon,
      height: 120,
      width: 120,
      fit: BoxFit.fill,
      animate: shouldAnimate,
      frameRate: FrameRate.max,

      delegates: LottieDelegates(
        values: [

          ValueDelegate.color(
            const ['**'], //name of the layer. ex: ['transparent2', '**']
            value: color,
          ),
        ],
      ),
    );
  }
}
