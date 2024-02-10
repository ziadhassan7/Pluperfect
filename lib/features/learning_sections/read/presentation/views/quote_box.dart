import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/custom_dialog/custom_dialog.dart';
import 'package:pluperfect/features/learning_sections/common/decoration_container.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/dialogs/translation_dialog_view.dart';
import 'package:pluperfect/features/learning_sections/read/logic/utils/level_controller.dart';
import '../../../../../core/styles/color_theme.dart';
import '../../../../../core/styles/padding.dart';
import '../widget/quote_widget.dart';
import '../widget/speaker_widget.dart';

class QuoteBox extends StatelessWidget {
  const QuoteBox(this.level, {super.key});

  final Level level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 20, horizontal: 38),
      child: DecorationContainer(
        padding: const CustomPadding(top: 20, horizontal: 20, bottom: 10),

        child: Column(
          children: [
            QuotesWidget(level),

            const SizedBox(height: 6,),

            Row(
              children: [

                const Spacer(),

                translateButton(context),


                const SpeakerWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget translateButton(BuildContext context){
    return IconButton(
        onPressed: (){
          //Shows a custom dialog
          // to show quote translation

          CustomUhh(context, view: const TranslationDialogView());

        },
        icon: SvgPicture.asset("assets/translate.svg", color: ColorTheme.text)
    );
  }
}
