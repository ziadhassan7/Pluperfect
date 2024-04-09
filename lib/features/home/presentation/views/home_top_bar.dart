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
          levelController(),

          const Spacer(),

          moneyPoints(),
        ],
      ),
    );
  }


  Widget levelController(){
    return Container(
      padding: const CustomPadding(horizontal: 18, vertical: 8),
      decoration: CustomDecoration(
        backgroundColor: white,
        borderColor: yellowLight,
        borderWidth: 4,
        isCircular: true,
      ),

      child: Row(
        children: [
          SvgPicture.asset("assets/level.svg", width: 24,),

          const SizedBox(width: 8,),
          TextView("English", color: ColorTheme.isDark ? black : ColorTheme.yellow, weight: FontWeight.bold,),
        ],
      ),
    );
  }

  Widget moneyPoints(){
    return Row(
      children: [
        SvgPicture.asset("assets/coin.svg", width: 24,),
        const SizedBox(width: 8,),
        TextView("15", color: ColorTheme.isDark ? white : ColorTheme.yellow, weight: FontWeight.bold,),
      ],
    );
  }
}
