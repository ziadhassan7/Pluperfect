import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_cubit.dart';
import '../../../core/localization/localization.dart';
import '../../../core/styles/color_theme.dart';
import 'context_menu/context_menu.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //close any context menu opened
          ContextMenu.close();
          //reset the steps
          context.read<StepsCubit>().reset();
          //close
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close_rounded,
          semanticLabel: LocalTxt.closeButton, color: ColorTheme.text, size: 28,)
    );
  }
}
