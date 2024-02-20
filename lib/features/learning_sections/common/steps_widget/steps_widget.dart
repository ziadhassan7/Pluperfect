import 'package:flutter/material.dart';
import 'package:pluperfect/core/constants/colors.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({super.key, required this.numberOfSteps, required this.color});

  final Color color;
  final int numberOfSteps;

  @override
  Widget build(BuildContext context) {

    int stepsPassed = 1;

    return Row(
      children: [
        for(int index = 0; index<numberOfSteps; index++)
          step(stepsPassed > index),

      ],
    );
  }

  Widget step(bool isSelected){
    return Container(
      height: 3, width: double.infinity,
      color: isSelected ? color : greyOpacity30,
    );
  }
}
