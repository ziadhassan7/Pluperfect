import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/quotes/quote_states.dart';
import '../../../../../core/azure_speech/azure_model.dart';
import '../../logic/utils/level_controller.dart';
import '../cubit/quotes/quotes_cubit.dart';
import '../views/context_menu/context_menu.dart';

class QuotesWidget extends StatefulWidget {
  const QuotesWidget(this.level, {super.key});

  final Level level;

  @override
  State<QuotesWidget> createState() => _QuotesWidgetState();
}

class _QuotesWidgetState extends State<QuotesWidget> {


  @override
  void initState() {
    super.initState();
    //Initial quote
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<QuotesCubit>().refresh(widget.level));
  }

  @override
  Widget build(BuildContext context) {

    QuoteStates state = context.watch<QuotesCubit>().state;

    if(state is ResponseState){

      return TextView(state.quote, scale: TypeScale.headline2,);
    }

    if(state is ScoreState){

      AzureModel result = state.result;
      String sentence = result.displayText!;
      List<Words> words = result.nBest!.first.words!;
      List<Words> processedWords = state.words;

      return getResult( processedWords);
    }

    return const Center(child: CircularProgressIndicator(),);

  }

  Widget getResult(List<Words> result){
    return Wrap(
      children: [
        for (Words word in result)
          getStylizedWord(
            word,
            onTap: (TapUpDetails details) {
                ContextMenu.show(context, details, word.word ?? "");
              },
          )
      ],
    );
  }


  Widget getStylizedWord(Words word, {Function(TapUpDetails)? onTap}){

    Color color = Colors.black;

    String processedWord;

    //if the word has a score less than 50, it is wrong
    if(word.accuracyScore! >= 98) color =  Colors.green;
    if(word.accuracyScore! >= 70 && word.accuracyScore! <98) color =  Colors.yellow;
    if(word.accuracyScore! < 70) color =  Colors.red;


    processedWord = "${word.word} ";


    return GestureDetector(
      onTapUp: onTap,

      child: Column(
        children: [
          getWord(processedWord, color),

          const SizedBox(height: 2,),

          getUnderLine(processedWord, color),

          const SizedBox(height: 6,),
        ],
      ),
    );
  }


  getWord(String word, Color color){
    return TextView(word, color: color, scale: TypeScale.headline2,);
  }

  getUnderLine(String word, Color color){
    return Container(
      height: 1,
      width: (word.split('').length -1) * 9.2, // Adjust the width as needed
      color: color,
    );
  }
}

