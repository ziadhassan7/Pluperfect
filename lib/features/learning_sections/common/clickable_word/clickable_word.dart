import 'package:flutter/material.dart';
import '../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../core/styles/color_theme.dart';
import '../pop_up_word_widget/context_menu.dart';

class ClickableWords extends StatelessWidget {
  const ClickableWords({super.key, required this.statement});

  final String statement;

  @override
  Widget build(BuildContext context) {
    return getResult(context);
  }


  Widget getResult(BuildContext context){

    List<String> words = statement.split(' ');

    return Wrap(
      children: [
        for (String word in words)
          getStylizedWord(
            "$word ",
            onTap: (TapUpDetails details) {
              ContextMenu.show(context, details, word);
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
