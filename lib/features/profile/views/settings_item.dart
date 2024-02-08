import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_widgets/text_view/text_view.dart';
import '../../../core/localization/localization.dart';
import '../../../core/styles/box_decoration.dart';
import '../../../core/styles/color_theme.dart';
import '../../../core/styles/padding.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.title, required this.iconPath, required this.onTap});

  final String title;
  final String iconPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 8, horizontal: 24),

      child: GestureDetector(

        onTap: onTap,

        child: Container(
          padding: const CustomPadding(vertical: 14, horizontal: 24),
          decoration: CustomDecoration(
            backgroundColor: ColorTheme.onBackground, radius: 24,
          ),

          child: Row(
            children: [

              //icon
              SvgPicture.asset(iconPath, color: ColorTheme.text,),

              const SizedBox(width: 18,),

              //title
              TextView(LocalTxt.darkMode, weight: FontWeight.bold, color: ColorTheme.text,),

              const Spacer(),

              // > icon
              const Icon(Icons.arrow_forward_ios_rounded),

            ],
          ),
        ),
      ),
    );
  }
}
