import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/gemini/gemini_client.dart';
import 'package:pluperfect/core/openai/openai_client.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/translate/translate_util.dart';
import '../../../../../core/styles/padding.dart';
import '../../../common/quotes_provider/quotes_controller.dart';

class TranslationDialogView extends StatelessWidget {
  const TranslationDialogView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: violetLight,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))
            ),

            padding: const CustomPadding(vertical: 14, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TextView("English", color: white,),

                SvgPicture.asset("assets/arrow.svg"),

                const TextView("Arabic", color: white,),
              ],
            )),


        ///Word Translation
        Padding(
          padding: const CustomPadding.all(40),
          child: FutureBuilder(
            future: getTranslation(),
            builder: (context, AsyncSnapshot<String?> snapshot) {

              if(snapshot.hasData){

                String? translated = snapshot.data;
                return TextView(translated ?? "لا يوجد ترجمة", scale: TypeScale.arabic,);

              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            }
          ),
        )
      ],
    );
  }

  Future<String?> getTranslation() async {

    return await GeminiClient.textOnly('Translate this to Arabic: \n'
        '${QuotesController.currentQuote}');
  }
}
