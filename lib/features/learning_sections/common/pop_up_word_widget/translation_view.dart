import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/core/translate/translate_util.dart';

class TranslationView extends StatelessWidget {
  const TranslationView({super.key, required this.word});

  final String word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 12, horizontal: 12),

      child: FutureBuilder(
        future: getTranslation(word),
        builder: (context, AsyncSnapshot<String> snapshot){

          if(snapshot.hasData){
            String translation = snapshot.data!;
            return Align(
                alignment: Alignment.topRight,
                child: TextView(translation, scale: TypeScale.arabic,));

          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }


  getTranslation(String word){
    return TranslateUtil.translate(word);
  }
}
