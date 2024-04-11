import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/custom_dialog/custom_dialog.dart';
import '../../../../../core/localization/localization.dart';
import '../../../../../core/speaker_widget/cubit/speak_cubit.dart';
import '../../../../../core/speaker_widget/speaker_widget.dart';
import '../../../../../core/styles/color_theme.dart';
import '../dialogs/translation_dialog_view.dart';

class QuotesWidget extends StatelessWidget {
  const QuotesWidget({super.key, required this.clickableWords,});

  final Widget clickableWords;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //

        clickableWords,

        const SizedBox(height: 6,),

        Row(
          children: [

            const Spacer(),

            IconButton(
                onPressed: (){
                  //Shows a custom dialog
                  // to show quote translation

                  CustomDialog(context, view: const TranslationDialogView());

                },
                icon: SvgPicture.asset("assets/translate.svg",
                    semanticsLabel: LocalTxt.translateButton,
                    color: ColorTheme.text)
            ),


            BlocProvider(
                create: (_) => SpeakerCubit(),
                child: SpeakerWidget()),
          ],
        ),
      ],
    );
  }
}
