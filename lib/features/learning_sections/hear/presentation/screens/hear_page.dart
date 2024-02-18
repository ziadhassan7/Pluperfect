import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/common/screen_touch/screen_touch_detector.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/exit_button.dart';
import '../views/bottom_navigation.dart';
import '../views/hear_box.dart';
import '../views/hear_score_widget.dart';

class HearPage extends StatelessWidget {
  const HearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,

      body: const SafeArea(
        child: Stack(
          children: [

            ScreenTouchDetector(),

            Column(
              children: [

                ///Top Widget
                Padding(
                  padding: CustomPadding(top: 26, bottom: 12, horizontal: 38),
                  child: Row(
                    children: [
                      ExitButton(),

                      //const Center(child: ScreenProgressBar(),),
                    ],
                  ),
                ),


                /// Quotes
                HearBox(),

                Spacer(),

                HearScoreWidget(), //your score

                /// Navigation
                BottomNavigation(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
