import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/app_screen.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/home/presentation/views/home_top_bar.dart';
import 'package:pluperfect/features/home/presentation/views/learning_sections_list.dart';
import 'package:pluperfect/features/home/presentation/views/dictionary_button_widget.dart';

import '../views/character_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double sizeBetween = 18;


  @override
  Widget build(BuildContext context) {

    double screenWidth = AppScreen(context).width;

    return SafeArea(

      child: Center(
        child: Padding(
          padding: const CustomPadding(horizontal: 28, top: 20),

          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [

                    /// Top bar
                    const HomeTopBar(),

                    const SizedBox(height: sizeBetween,),

                    ///Character
                    const CharacterButton(),

                    const SizedBox(height: sizeBetween,),

                    /// Learning Sections
                    LearningSectionsList(screenWidth: screenWidth,),
                  ],
                ),
            )],
          ),
        ),
      ),
    );
  }
}
