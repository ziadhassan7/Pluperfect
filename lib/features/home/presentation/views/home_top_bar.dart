import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/styles/box_decoration.dart';
import '../../../../core/styles/color_theme.dart';
import '../../../../core/styles/padding.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                decoration: CustomDecoration(
                  borderWidth: 2,
                  borderColor: white,
                  radius: 12,
                ),

                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12), // Set your desired radius here
                    child: SvgPicture.asset("assets/flags/united_kingdom.svg", height: 20,)),
              ),

              const SizedBox(width: 8,),
              TextView("En", color: ColorTheme.isDark ? white : ColorTheme.blue2, weight: FontWeight.bold,),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              SvgPicture.asset("assets/streak.svg", width: 20,),
              const SizedBox(width: 8,),
              TextView("15", color: ColorTheme.isDark ? white : ColorTheme.blue2, weight: FontWeight.bold,),
            ],
          ),
        ],
      ),
    );
  }
}
