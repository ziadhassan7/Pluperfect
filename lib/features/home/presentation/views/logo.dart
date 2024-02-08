import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/custom_text.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText("Pluperfect", size: 60, color: ColorTheme.accent,),

          CustomText("ˌpluˈpɜ˞fɪkt", color: grey.withOpacity(0.8), size: 18, fontFamily: FontFamily.notoSans,),
        ],
      ),
    );
  }
}

/*
    CustomText("Pluperfect", size: 54, color: ColorTheme.accent, fontFamily: FontFamily.comforta,),

    const Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: CustomText("ˌpluˈpɜ˞fɪkt", color: grey, size: 18, fontFamily: FontFamily.notoSans,)),
 */
