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

      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          children: [
            ...LearningSections.values.map((e) => button(
              context,
              buttonTitle: e.title,
              buttonDescription: e.description,
              page: e.page,
              color: e.buttonColor,
            ))
          ]
      ),
    );
  }

  Widget button(BuildContext context,
      {required String buttonTitle,
      required String buttonDescription,
        required Widget page,
        required Color color}) {

    return GestureDetector(
      onTap: ()=> AppRouter.navigateTo(context, page),

      child: Container(
        padding: const CustomPadding(horizontal: 18, vertical: 32),
        margin: const CustomPadding(vertical: 4),

        decoration: CustomDecoration(
          backgroundColor: color,
          radius: 28,
        ),

        child: Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(buttonTitle, scale: TypeScale.headline1,),

                  const SizedBox(height: 10,),

                  TextView(buttonDescription, scale: TypeScale.description,),
                ],
              ),
            ),

            const SizedBox(width: 28,),


            Container(
                alignment: Alignment.topRight,
                child: circularSymbol(icon: "assets/start.svg")),
          ],
        ),
      ),
    );
  }


  Widget circularSymbol({required String icon}){
    return Container(
      decoration: CustomDecoration(isCircular: true, backgroundColor: ColorTheme.isDark ? black.withOpacity(0.4) : white.withOpacity(0.4)),
      padding: const CustomPadding.all(12),
      child: SvgPicture.asset(icon, width: 24, color: ColorTheme.isDark ? white : black,),
    );
  }
}
