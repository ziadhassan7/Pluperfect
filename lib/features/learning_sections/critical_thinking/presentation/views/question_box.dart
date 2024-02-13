import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/features/learning_sections/common/decoration_container.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/critical_states.dart';
import '../../../../../core/styles/padding.dart';
import '../cubit/questions/critical_cubit.dart';
import 'critical_score_widget.dart';

class QuestionBox extends StatefulWidget {
  const QuestionBox({super.key});

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {

  @override
  void initState() {
    super.initState();
    //Initial quote
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<CriticalThinkingCubit>().getQuestion());
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const CustomPadding(vertical: 20, horizontal: 38),

      child: DecorationContainer(
          child: BlocBuilder<CriticalThinkingCubit, CriticalThinkingStates>(
            builder: (context, state){


              if(state is LoadingState){
                return const Center(child: CircularProgressIndicator(),);
              }

              if(state is ScoreState){
                return CriticalScoreWidget(
                    userInput: state.userInput,
                    correct: state.correct,
                    grammarScore: state.grammarScore,
                    pronScore: state.pronScore);
              }

              if(state is ResponseState){
                return TextView(state.question, scale: TypeScale.headline2,);
              }

              return const SizedBox.shrink();
            },
        )
      ),
    );
  }
}
