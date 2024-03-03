import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/speaker_widget/cubit/speak_cubit.dart';
import 'package:pluperfect/features/learning_sections/common/speaker_widget/speaker_widget.dart';

class WordItem extends StatelessWidget {
  const WordItem({super.key, required this.word, required this.translation});

  final String word;
  final String translation;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const CustomPadding.all(8),
        padding: const CustomPadding(horizontal: 16, bottom: 8),
        decoration: CustomDecoration(backgroundColor: ColorTheme.onBackground, radius: 18),

        child: Column(
          children: [
            Row(
              children: [
                TextView(word),
                BlocProvider(
                  create: (_)=> SpeakerCubit(),
                  child: SpeakerWidget(text: word, size: 18,)
                )
              ],
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: TextView(translation)),
          ],
        ));
  }
}
