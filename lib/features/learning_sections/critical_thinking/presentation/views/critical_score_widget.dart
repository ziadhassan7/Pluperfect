import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/app_screen.dart';
import '../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../common/score/circular_score_indicator.dart';


class CriticalScoreWidget extends StatelessWidget {
  const CriticalScoreWidget({
    super.key,
    required this.userInput,
    required this.correct,
    required this.grammarScore,
    required this.pronScore,
  });
  final String userInput;
  final String correct;
  final int grammarScore;
  final double pronScore;

  @override
  Widget build(BuildContext context) {

    double screenHeight = AppScreen(context).height;
    Color color = Colors.red;

    return SizedBox(
      height: screenHeight *0.4,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          TextView("Your Statement:", scale: TypeScale.headline1, color: color,),
          TextView(userInput,),

          const SizedBox(height: 10,),

          TextView("Correct Statement:", scale: TypeScale.headline1, color: color,),
          TextView(correct,),

          const SizedBox(height: 10,),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularScoreIndicator(score: (grammarScore*10),),
                  const TextView("Grammar Score", scale: TypeScale.small,),
                ],
              ),


              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularScoreIndicator(score: pronScore.ceil(),),
                  const TextView("Pronunciation Score", scale: TypeScale.small,),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }


}