import 'package:flutter/material.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/views/question_box.dart';
import '../../../../../core/styles/color_theme.dart';
import '../../../../../core/styles/padding.dart';
import '../views/bottom_navigation.dart';
import '../views/quesion_score_widget.dart';

class CriticalThinkingPage extends StatelessWidget {
  const CriticalThinkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,

      body: SafeArea(
        child: Column(
          children: [

            ///Top Widget
            Padding(
              padding: const CustomPadding(top: 26, bottom: 12, horizontal: 38),
              child: Row(
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close_rounded, color: ColorTheme.text, size: 28,)),

                  //const Center(child: ScreenProgressBar(),),
                ],
              ),
            ),

            ///Question
            const QuestionBox(),


            const Spacer(),

            const QuestionScoreWidget(), //your score

            /// Navigation
            const BottomNavigation(),
          ]
        ),
      ),
    );
  }
}
