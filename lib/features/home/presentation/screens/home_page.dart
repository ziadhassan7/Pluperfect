import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/app_router.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/app_screen.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/dictionary/presentation/screens/dictionary_page.dart';
import '../../../../core/constants/learning_sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double sizeBetween = 16;


  @override
  Widget build(BuildContext context) {

    double screenWidth = AppScreen(context).width;

    return SafeArea(

      child: Center(
        child: Padding(
          padding: const CustomPadding(horizontal: 40, top: 25),

          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [

                    /// Top bar
                    Padding(
                      padding: const CustomPadding(horizontal: 14, vertical: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: CustomDecoration(
                                  borderWidth: 2,
                                  borderColor: white,
                                  radius: 12,
                                ),

                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12), // Set your desired radius here
                                    child: SvgPicture.asset("assets/flags/united_kingdom.svg", height: 20,)),
                              ),

                              const SizedBox(width: 8,),
                              TextView("En", color: ColorTheme.isDark ? white : ColorTheme.blue2,),
                            ],
                          ),

                          const Spacer(),

                          Row(
                            children: [
                              SvgPicture.asset("assets/streak.svg", width: 20,),
                              const SizedBox(width: 8,),
                              TextView("15", color: ColorTheme.isDark ? white : ColorTheme.blue2,),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: sizeBetween,),

                    /// Practice Widget
                    Container(
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
                    ),

                    const SizedBox(height: sizeBetween,),

                    /// Saved Words
                    GestureDetector(
                      onTap: (){
                        AppRouter.navigateTo(context, const DictionaryPage());
                      },

                      child: Container(
                        padding: const CustomPadding.all(32),
                        decoration: CustomDecoration(
                          backgroundColor: ColorTheme.onBackground,
                          radius: 25
                        ),

                        child: Row(
                          children: [
                            const TextView("Your Dictionary", weight: FontWeight.bold,),

                            const Spacer(),

                            SvgPicture.asset("assets/bookmark.svg", color: ColorTheme.text,)
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: sizeBetween,),

                    /// Learning Sections
                    SizedBox(
                      width: screenWidth*0.78,

                      child: GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.9,
                          crossAxisCount: 2, // Number of columns
                          mainAxisSpacing: 8, // Spacing between rows
                          crossAxisSpacing: 8, // Spacing between columns
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
                    ),

                  ],
                ),
            )],
          ),
        ),
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
        padding: const CustomPadding.all(15),
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

            TextView(buttonTitle),
          ],
        ),
      ),
    );
  }


  Widget circularSymbol(String icon){
    return Container(
      decoration: CustomDecoration(isCircular: true, backgroundColor: ColorTheme.isDark ? white.withOpacity(0.4) : white),
      padding: const CustomPadding.all(12),
      child: SvgPicture.asset(icon, width: 24, ),
    );
  }

  /*setLevel(BuildContext context, Level level){
    context.read<QuotesCubit>().refresh(level);

    AppRouter.navigateTo(context, TrainingPage(level));
  }*/
}
