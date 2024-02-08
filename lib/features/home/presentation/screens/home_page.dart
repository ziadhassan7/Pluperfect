import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/screens/critical_thinking_page.dart';
import '../../../../core/localization/localization.dart';
import '../../../learning_sections/conversation/presentation/screens/chat_page.dart';
import '../../../learning_sections/hear/presentation/screens/hear_page.dart';
import '../../../learning_sections/read/logic/utils/level_controller.dart';
import '../../../learning_sections/read/presentation/screens/read_page.dart';
import '../views/carousel_item.dart';
import '../views/logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final double height = 350;


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            const Logo(),

            CarouselSlider.builder(
              itemCount: 4,
              options: CarouselOptions(
                height: height,
                viewportFraction: 0.7, //6
                initialPage: 0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.2, //0.3
                scrollDirection: Axis.horizontal,
              ),

              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  getItem(itemIndex),
            ),

          ],
        ),
      ),
    );
  }


  Widget getItem(int index){
    switch(index){
      case 0:
        return CarouselItem(
          height: height,
          title: LocalTxt.section1,
          description: LocalTxt.description1,
          color: ColorTheme.violet,
          iconPath: "assets/symbols/speak_symbol.svg",
          page: ReadPage(LevelController.level),
        );

      case 1:
        return CarouselItem(
          height: height,
          title: LocalTxt.section2,
          description: LocalTxt.description2,
          color: ColorTheme.green,
          iconPath: "assets/symbols/ear_symbol.svg",
          page: const HearPage(),
        );

      case 2:
        return CarouselItem(
          height: height,
          title: LocalTxt.section3,
          description: LocalTxt.description3,
          color: ColorTheme.blue,
          iconPath: "assets/symbols/chat_symbol.svg",
          page: const ChatPage(),
        );

      case 3:
        return CarouselItem(
          height: height,
          title: LocalTxt.section4,
          description: LocalTxt.description4,
          color: ColorTheme.red,
          iconPath: "assets/symbols/brain_symbol.svg",
          page: const CriticalThinkingPage(),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  /*setLevel(BuildContext context, Level level){
    context.read<QuotesCubit>().refresh(level);

    AppRouter.navigateTo(context, TrainingPage(level));
  }*/
}
