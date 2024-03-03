import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/custom_text.dart';
import 'package:pluperfect/core/future_loader_widget.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/dictionary/logic/data/repository/dictionary_repo.dart';
import 'package:pluperfect/features/dictionary/presentation/views/word_item.dart';
import '../../../../core/styles/color_theme.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,

      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const CustomPadding(vertical: 18,),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded, color: ColorTheme.text,),),

                CustomText(
                  "Saved Words",
                  color: ColorTheme.text,
                  weight: FontWeight.bold,
                  size: 35,
                  fontFamily: FontFamily.sansation,
                )
              ]
              ),
            ),

            FutureLoaderWidget(
              future: DictionaryRepo.getData(),

              builder: (data) {
                return Column(
                  children: [
                    ...data.map((e) => WordItem(
                          word: e.id,
                          translation: e.translation,
                        ))
                  ],
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.onBackground,
        foregroundColor: ColorTheme.text,
        child: const Icon(Icons.add_rounded),

        onPressed: () {

        },
      ),
    );
  }
}
