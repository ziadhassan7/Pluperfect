import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/steps_widget.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/views/quote_box.dart';
import '../../../common/close_page_controller.dart';
import '../../../common/exit_button.dart';
import '../../../common/screen_touch/screen_touch_detector.dart';
import '../../logic/utils/level_controller.dart';
import '../views/hear_bottom_toolbar.dart';
import '../views/read_score_widget.dart';

class ReadPage extends StatelessWidget {
  const ReadPage(
    this.level, {
    super.key,
  });

  final Level level;
  static final Color color = ColorTheme.violet;
  final int numberOfSteps = 3;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop){
        ClosePageController.exit(context);
      },

      child: Scaffold(
        backgroundColor: ColorTheme.background,

        body: SafeArea(
          child: Stack(
            children: [

              const ScreenTouchDetector(),

              Column(
                children: [

                  ///Top Bar
                  Padding(
                    padding: const CustomPadding(top: 26, bottom: 12, horizontal: 28),
                    child: Row(
                      children: [
                        const ExitButton(),

                        StepsWidget(numberOfSteps: numberOfSteps, color: color),
                      ],
                    ),
                  ),


                  /// Quotes
                  QuoteBox(level),


                  const Spacer(),

                  const ReadScoreWidget(),


                  /// Navigation
                  HearBottomToolbar(level, color, maximumSteps: numberOfSteps,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
