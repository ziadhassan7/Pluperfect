import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/future_loader_widget.dart';
import 'package:pluperfect/features/learning_sections/common/pop_up_word_widget/widgets/bookmark/bookmark_button.dart';
import 'package:pluperfect/features/learning_sections/common/pop_up_word_widget/widgets/translation_view.dart';
import 'package:pluperfect/features/learning_sections/common/speaker_widget/speaker_widget.dart';
import '../../../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../../../core/styles/box_decoration.dart';
import '../../../../../../../core/styles/color_theme.dart';
import '../../../../../../../core/styles/padding.dart';
import '../../../../../core/translate/translate_util.dart';
import '../widgets/bookmark/bookmark_button_cubit.dart';
import '../../speaker_widget/cubit/speak_cubit.dart';

//ignore: must_be_immutable
class PopUpWordView extends StatelessWidget {
  PopUpWordView({Key? key, required this.selectedText,}) : super(key: key);

  String selectedText;
  final double radius = 15;
  final double elevation = 15;
  final double height = 130;
  double width = 195;

  @override
  Widget build(BuildContext context,) {

    //remove words tags (/g/ or /r/)
    removeTags();

    //edit width based on word length
    editFlexibleWidth(context);

      return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius),),
        elevation: elevation,
        color: Colors.white,

        child: Container(
          width: width, height: height,
          decoration: CustomDecoration(
              radius: radius,
              backgroundColor: ColorTheme.onBackground
          ),

          child: FutureLoaderWidget(
            future: getTranslation(selectedText),

            builder: (translation){
              return Column(
                children: [
                  Container(
                      width: width,
                      padding: const CustomPadding(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 241, 255, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(radius),
                              topLeft: Radius.circular(radius))
                      ),
                      child: Row(
                        children: [
                          BlocProvider(
                            create: ((_) => BookmarkButtonCubit()),
                            child: BookmarkButton(selectedText, translation)),

                          SizedBox(width: width * 0.1,),

                          Expanded(child: TextView(
                            selectedText, weight: FontWeight.bold,
                            color: black,)),

                          BlocProvider(
                            create: (_) => SpeakerCubit(),
                            child: SpeakerWidget(text: selectedText, color: black,)),
                        ],
                      )),


                  ///Word Translation
                  TranslationView(translation: translation,),
                ],
              );
            }
          ),
        ),
      );
    }


    Future<String> getTranslation(String word){
      return TranslateUtil.translate(word);
    }

    editFlexibleWidth(BuildContext context){
      int wordLength = selectedText.split('').length;

      if(wordLength > 7 && wordLength < 8) {
        width = width * (wordLength/100) * 10;
      }

      if(wordLength > 12) {
        width = width * (wordLength/100) * 5;
      }
    }

    removeTags(){
      if(selectedText.startsWith('/r/') || selectedText.startsWith('/g/')){
        selectedText = "${selectedText.substring(3, selectedText.length-3)} ";
      }
    }
}