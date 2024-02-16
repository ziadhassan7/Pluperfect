import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/common/decoration_container.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/critical_states.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/context_menu/context_menu.dart';
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextView("Answer This:", color: Colors.red, scale: TypeScale.headline1, ),
                    //TextView(state.question, scale: TypeScale.headline2,),
                    getResult(state.question,)
                  ],
                );
              }

              return const SizedBox.shrink();
            },
        )
      ),
    );
  }


  Widget getResult(String question){

    List<String> words = question.split(' ');

    return Wrap(
      children: [
        for (String word in words)
          getStylizedWord(
            "$word ",
            onTap: (TapUpDetails details) {
              ContextMenu.show(context, details, word ?? "");
            },
          )
      ],
    );
  }


  Widget getStylizedWord(String word, {Function(TapUpDetails)? onTap}){

    return GestureDetector(
      onTapUp: onTap,

      child: Column(
        children: [
          TextView(word, scale: TypeScale.headline2,),

          const SizedBox(height: 2,),

          getUnderLine(word),

          const SizedBox(height: 6,),
        ],
      ),
    );
  }


  getWord(String word, Color color){
    return TextView(word, color: color, scale: TypeScale.headline2,);
  }

  getUnderLine(String word,){
    return Container(
      height: 1,
      width: (word.split('').length -1) * 10.2, // Adjust the width as needed
      color: ColorTheme.text,
    );
  }
}
