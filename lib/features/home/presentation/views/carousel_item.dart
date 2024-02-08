import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/padding.dart';
import '../../../../core/app_router.dart';
import '../../../../core/styles/box_decoration.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.height,
    required this.title,
    required this.description,
    required this.color,
    required this.iconPath,
    required this.page,
  });

  final double height;
  final String title;
  final String description;
  final Color color;
  final String iconPath;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        AppRouter.navigateTo(context, page);
      },

      child: Stack(
        alignment: AlignmentDirectional.topCenter,

        children: [
          Container(
            height: height, width: 140,
            padding: const CustomPadding.all(34),
            decoration: CustomDecoration(radius: 25, backgroundColor: color.withOpacity(0.2)),
          ),

          Container(
            height: height-10, width: 180,
            padding: const CustomPadding.all(34),
            decoration: CustomDecoration(radius: 25, backgroundColor: color.withOpacity(0.4)),
          ),

          Container(
            height: height-20, width: 260,
            padding: const CustomPadding.all(34),
            decoration: CustomDecoration(radius: 25, backgroundColor: color),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SvgPicture.asset(iconPath, color: white.withOpacity(0.3),)),

                const Spacer(),

                TextView(description, color: white, scale: TypeScale.description,),

                const SizedBox(height: 12,),

                TextView(title, color: white, scale: TypeScale.headline2,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
