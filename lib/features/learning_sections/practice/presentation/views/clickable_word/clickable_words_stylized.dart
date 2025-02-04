import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import '../../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../../core/azure_speech/azure_model.dart';
import '../pop_up_word_widget/pop_up_word.dart';

class ClickableWordsStylized extends StatelessWidget {
  const ClickableWordsStylized({super.key, required this.statement});

  final List<Words> statement;

  @override
  Widget build(BuildContext context) {
    return getResult(context);
  }

  Widget getResult(BuildContext context,){
    return Wrap(
      children: [
        for (Words word in statement)
          getStylizedWord(
            word,
            onTap: (TapUpDetails details) {
              PopUpWord.show(context, details, word.word ?? "");
            },
          )
      ],
    );
  }


  Widget getStylizedWord(Words word, {Function(TapUpDetails)? onTap}){

    Color color = Colors.black;

    String processedWord;

    //if the word has a score less than 50, it is wrong
    if(word.accuracyScore! >= 68) color =  Colors.green;
    if(word.accuracyScore! >= 40 && word.accuracyScore! <68) color =  ColorTheme.yellow;
    if(word.accuracyScore! < 40) color =  Colors.red;


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
