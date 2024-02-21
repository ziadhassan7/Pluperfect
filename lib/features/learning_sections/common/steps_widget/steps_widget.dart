import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_cubit.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_states.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({super.key, required this.numberOfSteps, required this.color});

  final Color color;
  final int numberOfSteps;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<StepsCubit, StepsState>(
      builder: (context, state) {

        if(state is NextState){

          int currentStep = state.currentStep;

          return Expanded(
            child: Padding(
              padding: const CustomPadding(horizontal: 12),
              child: Row(
                children: [
                  for(int index = 0; index<numberOfSteps; index++)
                    step(currentStep > index),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      }
    );
  }

  Widget step(bool isSelected){
    return Expanded(
      child: Container(
        margin: const CustomPadding.all(4),
        height: 8, width: double.infinity,
        decoration: CustomDecoration(
          radius: 6,
          backgroundColor: isSelected ? color : greyOpacity30,
        ),
      ),
    );
  }
}
