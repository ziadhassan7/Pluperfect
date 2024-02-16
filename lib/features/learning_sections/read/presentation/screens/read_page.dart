import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/views/quote_box.dart';
import '../../../common/context_menu/context_menu.dart';
import '../../../common/screen_touch/screen_touch_detector.dart';
import '../../logic/utils/level_controller.dart';
import '../views/bottom_navigation.dart';
import '../views/quote_prgress_bar.dart';
import '../views/read_score_widget.dart';

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
        backgroundColor: ColorTheme.background,

        body: SafeArea(
          child: Stack(
            children: [

              const ScreenTouchDetector(),

              Column(
                children: [

                  ///Top Widget
                  Padding(
                    padding: const CustomPadding(top: 26, bottom: 12, horizontal: 38),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              //close any context menu opened
                              ContextMenu.close();
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close_rounded, color: ColorTheme.text, size: 28,)),

                        const Center(child: QuoteProgressBar(),),
                      ],
                    ),
                  ),


                  /// Quotes
                  QuoteBox(level),


                  const Spacer(),

                  const ReadScoreWidget(),


                  /// Navigation
                  BottomNavigation(level),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
