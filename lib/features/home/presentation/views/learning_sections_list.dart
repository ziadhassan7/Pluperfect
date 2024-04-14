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
        padding: const CustomPadding(horizontal: 22, vertical: 32),
        margin: const CustomPadding(vertical: 6),

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
                  ///Title
                  TextView(buttonTitle, scale: TypeScale.headline2,),

                  const SizedBox(height: 10,),

                  ///Description
                  TextView(
                    buttonDescription,
                    scale: TypeScale.caption,
                    color: ColorTheme.text.withOpacity(0.8),
                    weight: FontWeight.w300,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 28,),


            ///Start icon
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
      decoration: CustomDecoration(isCircular: true, backgroundColor: white.withOpacity(0.4)),
      padding: const CustomPadding.all(16),
      child: SvgPicture.asset(icon, width: 18, color: black,),
    );
  }
}
