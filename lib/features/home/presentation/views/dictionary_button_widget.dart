import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pluperfect/core/localization/localization.dart';
import '../../../../core/app_router.dart';
import '../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../core/styles/box_decoration.dart';
import '../../../../core/styles/color_theme.dart';
import '../../../../core/styles/padding.dart';
import '../../../dictionary/presentation/screens/dictionary_page.dart';

class DictionaryButtonWidget extends StatelessWidget {
  const DictionaryButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppRouter.navigateTo(context, const DictionaryPage());
      },

      child: Container(
        padding: const CustomPadding.all(32),
        decoration: CustomDecoration(
            backgroundColor: ColorTheme.onBackground,
            radius: 25
        ),

        child: Row(
          children: [
            TextView(LocalTxt.dictionaryWidget, weight: FontWeight.bold,),

            const Spacer(),

            SvgPicture.asset("assets/bookmark.svg", color: ColorTheme.text,)
          ],
        ),
      ),
    );
  }
}
