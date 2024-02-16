import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/common/screen_touch/screen_touch_detector.dart';
import '../../../../../core/styles/padding.dart';
import '../views/bottom_navigation.dart';
import '../views/hear_box.dart';
import '../views/hear_score_widget.dart';

class HearPage extends StatelessWidget {
  const HearPage({super.key});

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


                /// Quotes
                const HearBox(),

                const Spacer(),

                const HearScoreWidget(), //your score

                /// Navigation
                const BottomNavigation(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
