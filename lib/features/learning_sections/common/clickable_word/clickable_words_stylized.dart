import 'package:flutter/material.dart';
import '../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../core/azure_speech/azure_model.dart';
import '../context_menu/context_menu.dart';

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
