import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_cubit.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_states.dart';
import '../../../../../core/styles/color_theme.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/close_page_controller.dart';
import '../../../common/exit_button.dart';
import '../../../common/level_controller.dart';
import '../../../common/steps_widget/steps_widget.dart';
import '../cubit/practice_cubit.dart';
import '../views/practice_box.dart';
import '../views/practice_bottom_toolbar.dart';
import '../views/practice_score_widget.dart';
import '../views/screen_touch_detector.dart';

class PracticePage extends StatelessWidget {
  const PracticePage(this.level, {super.key});

  final Level level;
  static final Color color = ColorTheme.blue2;
  final int numberOfSteps = 6;

  static PracticeSection section = PracticeSection.quote;

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
          child: BlocProvider(
            create: (context) => PracticeCubit(),

            child: BlocListener<StepsCubit, StepsState>(
              listener: (context, states){
                if(states is NextState){

                  if(states.currentStep >= 3){
                    section = PracticeSection.hear;
                  } else {
                    section = PracticeSection.quote;
                  }
                }
              },


              child: Stack(
                  children: [

                    const ScreenTouchDetector(),

                    Column(
                      children: [

                        ///Top Bar
                        Padding(
                          padding: const CustomPadding(
                              top: 26, bottom: 12, horizontal: 28),
                          child: Row(
                            children: [
                              const ExitButton(),

                              StepsWidget(
                                  numberOfSteps: numberOfSteps, color: color),
                            ],
                          ),
                        ),


                        /// Quotes
                        const PracticeBox(),


                        const Spacer(),

                        const PracticeScoreWidget(),


                        /// Navigation
                        PracticeBottomToolbar(
                          color, maximumSteps: numberOfSteps,),

                      ],
                    ),
                  ],
                ),
            )
          ),
        ),
      ),
    );
  }
}
