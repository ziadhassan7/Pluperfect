import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_router.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/close_page_controller.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/screens/chat_page.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/screens/critical_thinking_page.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/screens/hear_page.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/screens/read_page.dart';
import '../../../../core/constants/colors.dart';
import '../../read/logic/utils/level_controller.dart';

enum ButtonColors {
  violet, green, blue, red
}

enum LearningSections {
  readPage(
    title: "Read",
    page: ReadPage(Level.beginner)
  ),
  hearPage(
    title: "Hear & Repeat",
    page: HearPage()
  ),
  criticalPage(
    title: "Critical Thinking",
    page: CriticalThinkingPage()
  ),
  chatPage(
    title: "Chat",
    page: ChatPage()
  );

  final String title;
  final Widget page;

  const LearningSections({required this.title, required this.page});

  Color get buttonColor {
    switch(this){
      case LearningSections.readPage:
        return ColorTheme.violet;
      case LearningSections.hearPage:
        return ColorTheme.green;
      case LearningSections.criticalPage:
        return ColorTheme.red;
      case LearningSections.chatPage:
        return ColorTheme.blue;
    }
  }
}

class LearningSectionsButtons extends StatelessWidget {
  const LearningSectionsButtons({super.key, required this.currentPage});

  final LearningSections currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const CustomPadding(horizontal: 20),
      height: 170, width: 370,
      child: GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2,
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 8, // Spacing between rows
          crossAxisSpacing: 8, // Spacing between columns
        ),
        children: [
          ...LearningSections.values.map((e) => button(
              context,
              page: e.page,
              buttonTitle: e.title,
              color: e.buttonColor,
              isSelected: e == currentPage
          ))
        ],
      ),
    );
  }

  Widget button(BuildContext context, {required Widget page, required String buttonTitle, required Color color, required bool isSelected}){
    return
      isSelected
      ? InkWell(
        onTap: ()=> navigateToPage(context, page),
        child: Container(
            margin: const CustomPadding.all(2),
            decoration: CustomDecoration(radius: 18, borderColor: color, borderWidth: 6, backgroundColor: color.withOpacity(0.1)),

            child: Center(child: Row(
              children: [
                Padding(
                  padding: const CustomPadding(horizontal: 14),
                  child: Icon(Icons.refresh_rounded, color: color,),
                ),
                TextView("Retry", color: color, weight: FontWeight.bold, scale: TypeScale.caption,),
              ],
            ))),
      )

      : InkWell(
        onTap: ()=> navigateToPage(context, page),
        child: Container(
            margin: const CustomPadding.all(2),
            decoration: CustomDecoration(radius: 18, backgroundColor: color),

            child: Center(child: TextView(buttonTitle, color: white, weight: FontWeight.bold, scale: TypeScale.caption,))),
      );
  }

  void navigateToPage(BuildContext context, Widget page){
    //reset page steps
    ClosePageController.resetPageSteps(context);
    //exit dialog
    Navigator.pop(context);
    //navigate to other page
    AppRouter.navigateTo(context, page, replace: true);
  }
}
