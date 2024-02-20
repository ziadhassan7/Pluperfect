import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/common/screen_touch/screen_touch_detector.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/steps_widget.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/exit_button.dart';
import '../views/bottom_navigation.dart';
import '../views/hear_box.dart';
import '../views/hear_score_widget.dart';

class HearPage extends StatelessWidget {
  const HearPage({super.key});

  static final Color color = ColorTheme.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,

      body: SafeArea(
        child: Stack(
          children: [

            const ScreenTouchDetector(),

            Column(
              children: [

                ///Top Bar
                Padding(
                  padding: const CustomPadding(top: 26, bottom: 12, horizontal: 38),
                  child: Row(
                    children: [
                      const ExitButton(),

                      StepsWidget(numberOfSteps: 2, color: color)
                    ],
                  ),
                ),


                /// Quotes
                const HearBox(),

                const Spacer(),

                const HearScoreWidget(), //your score

                /// Navigation
                BottomNavigation(color),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
