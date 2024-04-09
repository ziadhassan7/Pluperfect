import 'package:flutter/material.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/localization/localization.dart';
import 'package:pluperfect/features/dictionary/presentation/screens/dictionary_page.dart';
import 'package:pluperfect/features/profile/screens/profile_page.dart';
import '../core/styles/color_theme.dart';
import '../features/home/presentation/screens/home_page.dart';
import 'navbar/button.dart';
import 'navbar/nav_bar.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {


  static int currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorTheme.background,

      body: IndexedStack(
        index: currentIndex,

        children: const [
          HomePage(),

          DictionaryPage(),

          ProfilePage(),
        ],
      ),


      bottomNavigationBar: CustomNavBar(

        elevation: 28,

        backgroundColor: ColorTheme.onBackground,

        padding: const EdgeInsets.symmetric(horizontal: 70),

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),

        foregroundColorSelected: accentColor,
        foregroundColorUnSelected: const Color.fromRGBO(185, 169, 169, 1),


        children: [
            NavBarButton(
              icon: "assets/home.svg",
              index: 0,
              semanticLabel: LocalTxt.homeButton,
              onTap: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
            ),

            NavBarButton(
              icon: "assets/bookmark.svg",
              index: 1,
              semanticLabel: LocalTxt.bookmarksButton,
              onTap: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
            ),

            NavBarButton(
              icon: "assets/profile.svg",
              index: 1,
              semanticLabel: LocalTxt.profileButton,
              onTap: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
            ),
        ],
      )
    );
  }
}