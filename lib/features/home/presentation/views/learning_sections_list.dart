import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import '../../../../core/app_router.dart';
import '../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/learning_sections.dart';
import '../../../../core/styles/box_decoration.dart';
import '../../../../core/styles/padding.dart';

class LearningSectionsList extends StatelessWidget {
  const LearningSectionsList({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {

    return Expanded(

      child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.08,
            crossAxisCount: 2, // Number of columns
            mainAxisSpacing: 12, // Spacing between rows
            crossAxisSpacing: 12, // Spacing between columns
          ),
          children: [
            ...LearningSections.values.map((e) => button(
              context,
              buttonTitle: e.title,
              icon: e.icon,
              page: e.page,
              color: e.buttonColor,
            ))
          ]
      ),
    );
  }

  Widget button(BuildContext context,
      {required String buttonTitle,
        required String icon,
        required Widget page,
        required Color color}) {

    return GestureDetector(
      onTap: ()=> AppRouter.navigateTo(context, page),

      child: Container(
        padding: const CustomPadding.all(18),
        decoration: CustomDecoration(
          backgroundColor: color,
          radius: 28,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
                alignment: Alignment.topRight,
                child: circularSymbol(icon)),

            const Spacer(),

            TextView(buttonTitle, scale: TypeScale.headline1, ),
          ],
        ),
      ),
    );
  }


  Widget circularSymbol(String icon){
    return Container(
      decoration: CustomDecoration(isCircular: true, backgroundColor: ColorTheme.isDark ? black.withOpacity(0.4) : white.withOpacity(0.4)),
      padding: const CustomPadding.all(12),
      child: SvgPicture.asset(icon, width: 24, color: ColorTheme.isDark ? white : black,),
    );
  }
}
