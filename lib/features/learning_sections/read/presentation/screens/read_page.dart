import 'package:flutter/material.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/views/quote_box.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/views/screen_touch/screen_touch_detector.dart';
import '../../logic/utils/level_controller.dart';
import '../views/bottom_navigation.dart';
import '../views/context_menu/context_menu.dart';
import '../views/quote_prgress_bar.dart';
import '../widget/interaction_widget.dart';
import '../widget/score_widget.dart';

class ReadPage extends StatelessWidget {
  const ReadPage(
    this.level, {
    super.key,
  });

  final Level level;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop)=> ContextMenu.close(), ////close any context menu opened

      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 251, 255, 1), //rgba(250, 251, 255, 1)

        body: SafeArea(
          child: Stack(
            children: [

              const ScreenTouchDetector(),

              Padding(
                padding: const CustomPadding(vertical: 24, horizontal: 38),
                child: Column(
                  children: [

                    ///Top Widget
                    Padding(
                      padding: const CustomPadding(bottom: 20, horizontal: 8),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                //close any context menu opened
                                ContextMenu.close();
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close_rounded, color: black, size: 28,)),

                          const Center(child: QuoteProgressBar(),),
                        ],
                      ),
                    ),


                    /// Quotes
                    QuoteBox(level),

                    const ScoreWidget(),

                    const Spacer(),

                    const InteractionWidget(),

                    /// Navigation
                    BottomNavigation(level),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
