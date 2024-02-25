import 'package:flutter/material.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/steps_widget.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/views/question_box.dart';
import '../../../../../core/styles/color_theme.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/close_page_controller.dart';
import '../../../common/exit_button.dart';
import '../../../common/screen_touch/screen_touch_detector.dart';
import '../views/critical_bottom_toolbar.dart';


class CriticalThinkingPage extends StatelessWidget {
  const CriticalThinkingPage({super.key});

  static final Color color = ColorTheme.red;
  final int numOfSteps = 2;

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
                    padding: const CustomPadding(top: 26, bottom: 12, horizontal: 38),
                    child: Row(
                      children: [
                        const ExitButton(),

                        StepsWidget(numberOfSteps: numOfSteps, color: color),
                      ],
                    ),
                  ),

                  ///Question
                  const QuestionBox(),


                  const Spacer(),

                  /// Navigation
                  CriticalBottomToolbar(color, maximumSteps: numOfSteps,),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
