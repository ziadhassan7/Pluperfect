import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/clickable_word/clickable_words_stylized.dart';
import '../cubit/hear/hear_cubit.dart';
import '../cubit/hear/hear_states.dart';

class SentenceWidget extends StatelessWidget {
  const SentenceWidget({super.key,});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HearCubit, HearStates>(
      builder: (context, state) {
        if(state is ScoreState){
          return Padding(
            padding: const CustomPadding(top: 18),
            child: ClickableWordsStylized(statement: state.words),
          );
        }

        return const SizedBox.shrink();
      }
    );
  }

}

