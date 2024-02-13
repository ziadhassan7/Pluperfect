import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/app_screen.dart';


class CriticalScoreWidget extends StatelessWidget {
  const CriticalScoreWidget({
    super.key,
    required this.userInput,
    required this.correct,
    required this.feedback,
    required this.grammarScore,
    required this.pronScore,
  });
  final String userInput;
  final String correct;
  final String feedback;
  final int grammarScore;
  final double pronScore;

  @override
  Widget build(BuildContext context) {

    double screenHeight = AppScreen(context).height;

    return SizedBox(
      height: screenHeight *0.4,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextView(feedback),

        ],
      ),
    );
  }


}