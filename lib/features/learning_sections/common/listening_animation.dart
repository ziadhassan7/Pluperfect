import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/styles/color_theme.dart';

class ListeningAnimation extends StatelessWidget {
  const ListeningAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return button('assets/animations/blue_good.json', true);
  }

  Widget button(String icon, bool shouldAnimate){
    return Lottie.asset(
      icon,
      height: 120, width: 120, fit: BoxFit.fill,
      animate: shouldAnimate,
      frameRate: FrameRate.max,

      /*delegates: LottieDelegates(
        values: [
          ValueDelegate.color(
            const ['base', '**'],
            value: ColorTheme.violet,
          ),
          ValueDelegate.color(
            const ['Base Layer 4', '**'],
            value: ColorTheme.violet,
          ),
          ValueDelegate.color(
            const ['Base Layer 3', '**'],
            value: ColorTheme.violet,
          ),
        ],
      ),*/

      /* controller: _controller,
        onLoaded: (composition) {
          // Configure the AnimationController
          _controller
            ..duration = composition.duration
            ..forward();
        },*/


    );
  }
}
