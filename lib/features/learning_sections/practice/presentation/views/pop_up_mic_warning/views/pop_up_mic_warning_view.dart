import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/padding.dart';
import '../../../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../../../core/styles/box_decoration.dart';
import '../../../../../../../core/styles/color_theme.dart';

//ignore: must_be_immutable
class PopUpMicWarningView extends StatelessWidget {
  PopUpMicWarningView({Key? key,}) : super(key: key);

  final double radius = 15;
  final double elevation = 15;
  double width = 200;

  @override
  Widget build(BuildContext context,) {

      return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius),),
        elevation: elevation,
        color: Colors.white,

        child: Container(
          width: width,
          padding: const CustomPadding.all(8),
          decoration: CustomDecoration(
              radius: radius,
              backgroundColor: ColorTheme.onBackground
          ),

          child: const TextView("Hold the mic to record"),
        ),
      );
    }

}