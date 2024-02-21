import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CongratulationDialogView extends StatelessWidget {
  const CongratulationDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Lottie.asset(
          "assets/animations/congrats.json",
          fit: BoxFit.fill,
          frameRate: FrameRate.max,
        ),

      ],
    );
  }
}
