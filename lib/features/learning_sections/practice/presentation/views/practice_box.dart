import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/cubit/practice_cubit.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/cubit/practice_states.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/screens/practice_page.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/widget/quotes_widget.dart';
import 'package:pluperfect/features/learning_sections/common/clickable_word/clickable_words_stylized.dart';
import 'package:pluperfect/features/learning_sections/common/decoration_container.dart';
import '../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/clickable_word/clickable_word.dart';
import '../widget/hear_widget.dart';

class PracticeBox extends StatefulWidget {
  const PracticeBox({super.key});

  @override
  State<PracticeBox> createState() => _PracticeBoxState();
}


class _PracticeBoxState extends State<PracticeBox> {

  @override
  void initState() {
    super.initState();
    //Initial quote
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<PracticeCubit>().refresh(section: PracticePage.section));
  }

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const CustomPadding(vertical: 20, horizontal: 38),
      child: DecorationContainer(
        padding: const CustomPadding(vertical: 30, horizontal: 20),
        child: BlocBuilder<PracticeCubit, PracticeStates>(
          builder: (context, state){

            ///Quote
            if(state is QuoteState){

              return QuotesWidget(clickableWords: ClickableWords(statement:state.quote));
            }

            ///Hear
            if(state is HearState){

              return HearWidget(state.quote,);
            }

            ///Question
            if(state is QuestionState){

              return questionWidget(state.question);
            }


            ///Score
            //Quote, Hear
            if(state is QuoteScoreState){

              return QuotesWidget(clickableWords: ClickableWordsStylized(statement:state.words));
            }


            return const Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );

  }



  Widget questionWidget(String statement) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          "Answer This:", color: ColorTheme.red, scale: TypeScale.headline1,),

        ClickableWords(statement: statement,),
      ],
    );
  }
}

