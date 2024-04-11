import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/snack_bar_util.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/dictionary/presentation/cubit/dictionary_cubit.dart';
import 'package:pluperfect/features/dictionary/presentation/dialogs/delete_word/delete_word_dialog.dart';
import '../../../../core/speaker_widget/cubit/speak_cubit.dart';
import '../../../../core/speaker_widget/speaker_widget.dart';

class WordItem extends StatelessWidget {
  const WordItem({super.key, required this.word, required this.translation});

  final String word;
  final String translation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorTheme.background,
      onLongPress: (){
        DeleteWordDialog.show(context, word);
      },

      child: Dismissible(

        key: Key(word),
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          color: Colors.red,
          child: const Padding(
            padding: CustomPadding(horizontal: 20),
            child: Icon(Icons.delete_rounded,
              color: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          //delete item
          context.read<DictionaryCubit>().delete(word);
          //show scaffold
          SnackBarUtil.show(context, message: "$word deleted");
        },

        child: Container(
            margin: const CustomPadding(vertical: 8, horizontal: 20),
            padding: const CustomPadding(horizontal: 16, bottom: 8),
            decoration: CustomDecoration(backgroundColor: ColorTheme.onBackground, radius: 18),

            child: Column(
              children: [
                Row(
                  children: [
                    TextView(word),
                    BlocProvider(
                        create: (_)=> SpeakerCubit(),
                        child: SpeakerWidget(text: word, size: 18,)
                    )
                  ],
                ),

                Align(
                    alignment: Alignment.bottomRight,
                    child: TextView(translation)),
              ],
            )),
      ),
    );
  }
}
