import 'package:flutter/material.dart';
import '../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/styles/box_decoration.dart';
import '../../../../core/styles/color_theme.dart';
import '../../../../core/styles/padding.dart';

class DailyMissionsWidget extends StatelessWidget {
  const DailyMissionsWidget({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 180,
      padding: const CustomPadding.all(32),
      decoration: CustomDecoration(
          backgroundColor: ColorTheme.blue2,
          radius: 25
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextView("Daily Missions", scale: TypeScale.headline2, weight: FontWeight.bold, color: white,),

          const TextView("Practice English for 5 mins every day.", weight: FontWeight.w300, color: white,),

          const Spacer(),

          Row(
            children: [
              SizedBox(
                width: screenWidth *0.5,
                child: LinearProgressIndicator(
                  value: 0.60,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(25),
                  backgroundColor: ColorTheme.background,
                  color: ColorTheme.yellow,
                ),
              ),

              const Spacer(),

              const TextView("60%", color: white,),
            ],
          )
        ],
      ),
    );
  }
}
