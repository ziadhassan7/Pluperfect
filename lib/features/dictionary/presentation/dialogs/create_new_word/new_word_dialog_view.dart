import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/dictionary/presentation/cubit/dictionary_cubit.dart';
import '../../../../../core/constants/colors.dart';

class NewWordDialogView extends StatelessWidget {
  const NewWordDialogView({super.key});

  static final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: inputController,

          style: TextStyle(color: ColorTheme.text),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),

            hintText: 'Enter a new word',
            hintStyle: TextStyle(color: ColorTheme.text.withOpacity(0.4), fontFamily: 'Sansation'),
            border: InputBorder.none,
          ),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),

            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(ColorTheme.blue2),
              ),

              onPressed: () async {
                context.read<DictionaryCubit>().saveWord(inputController.text); //save word
                inputController.clear(); //clear current text input
                Navigator.pop(context); //close dialog
              },
              child: TextView("Save", color: ColorTheme.isDark ? black : white,),
            ),
          ),
        ),
      ],
    );
  }
}
