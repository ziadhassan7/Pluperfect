import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pluperfect/core/app_router.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/index/index_page.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/styles/color_theme.dart';
import '../close_page_controller.dart';
import 'learning_sections_buttons.dart';

class CongratulationDialogView extends StatelessWidget {
  const CongratulationDialogView({super.key, required this.currentPage});

  final LearningSections currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        closeButton(context),

        congratsGif(),

        const Padding(
          padding: CustomPadding(vertical: 40),
          child: TextView("Congratulation", weight: FontWeight.bold,),
        ),

        LearningSectionsButtons(currentPage: currentPage,),

      ],
    );
  }

  Widget closeButton(BuildContext context){
    return Container(
      margin: const CustomPadding(horizontal: 25, top: 15),
      alignment: Alignment.topLeft,
      child: InkWell(
          onTap: () {
            //reset page steps
            ClosePageController.resetPageSteps(context);
            //go back to home page
            AppRouter.navigateTo(context, const IndexPage(), deleteAll: true);
          },

          child: Icon(
            Icons.close_rounded,
            semanticLabel: LocalTxt.closeButton, color: ColorTheme.text, size: 28,)
      ),
    );
  }

  Widget congratsGif(){
    return Lottie.asset(
      "assets/animations/congrats.json",
      frameRate: FrameRate.max,
    );
  }


}
