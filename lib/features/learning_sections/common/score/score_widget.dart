import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/app_screen.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'circular_score_indicator.dart';


class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key, required this.score,});

  final int score;

  @override
  Widget build(BuildContext context) {

    double screenWidth = AppScreen(context).width;

    return Padding(
      padding: const CustomPadding(vertical: 28, horizontal: 38),

      child: Row(
        children: [
          SizedBox(
            width: screenWidth*0.5,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView("Your fluency score:", scale: TypeScale.headline2, weight: FontWeight.bold,),
                TextView("This is how much you sound like a native speaker", scale: TypeScale.caption,),
              ],
            ),
          ),

          const Spacer(),

          CircularScoreIndicator(score: score,),
        ],
      ),
    );
  }

}

