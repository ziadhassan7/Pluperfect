import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/clickable_word/clickable_words_stylized.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/quotes/quote_states.dart';
import '../../../../../core/azure_speech/azure_model.dart';
import '../../../common/clickable_word/clickable_word.dart';
import '../../logic/utils/level_controller.dart';
import '../cubit/quotes/quote_cubit.dart';

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
        .addPostFrameCallback((_) => context.read<QuoteCubit>().refresh(widget.level));
  }

  @override
  Widget build(BuildContext context) {

    QuoteStates state = context.watch<QuoteCubit>().state;

    if(state is ResponseState){

      return ClickableWords(statement: state.quote,);
      //return TextView(state.quote, scale: TypeScale.headline2,);
    }

    if(state is ScoreState){

      AzureModel result = state.result;
      String sentence = result.displayText!;
      List<Words> words = result.nBest!.first.words!;
      List<Words> processedWords = state.words;

      return ClickableWordsStylized(statement: processedWords,);
    }

    return const Center(child: CircularProgressIndicator(),);

  }
}

