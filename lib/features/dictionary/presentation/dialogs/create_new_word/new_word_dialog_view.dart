import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/translate/translate_util.dart';
import 'package:pluperfect/features/dictionary/logic/data/repository/dictionary_repo.dart';

class NewWordDialogView extends StatelessWidget {
  const NewWordDialogView({super.key});

  static final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: inputController,

          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            hintText: 'Enter a new word',
            border: InputBorder.none,
          ),
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),

          child: ElevatedButton(

            onPressed: () async {
              DictionaryRepo.saveItem(
                  word: inputController.text,
                  translation: await TranslateUtil.translate(inputController.text)
              );
            },
            child: const TextView("Save"),
          ),
        ),
      ],
    );
  }
}
