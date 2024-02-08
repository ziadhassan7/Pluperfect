import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/translate/translate_util.dart';

class TranslationView extends StatelessWidget {
  const TranslationView({super.key, required this.word});

  final String word;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTranslation(word),
      builder: (context, AsyncSnapshot<String> snapshot){

        if(snapshot.hasData){
          String translation = snapshot.data!;
          return TextView(translation);

        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }


  getTranslation(String word){
    return TranslateUtil.translate(word);
  }
}
