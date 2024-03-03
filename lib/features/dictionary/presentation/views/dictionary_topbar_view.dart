import 'package:flutter/material.dart';
import '../../../../core/app_widgets/text_view/custom_text.dart';
import '../../../../core/styles/color_theme.dart';
import '../../../../core/styles/padding.dart';

class DictionaryTopBarView extends StatelessWidget {
  const DictionaryTopBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
