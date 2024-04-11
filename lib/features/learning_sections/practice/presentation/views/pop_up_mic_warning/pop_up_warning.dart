import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/app_screen.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/views/pop_up_mic_warning/views/pop_up_mic_warning_view.dart';
import '../../../../../../core/pop_up_widget/pop_up.dart';

class ContextMenu{

  static late PopUp popUp;

  static void show(BuildContext context,) {
    popUp = PopUp.show(context,
        verticalPosition: _getVerticalPosition(context),
        horizontalPosition: _getHorizontalPosition(context),
        widget: PopUpMicWarningView());

  }

  static close(){
    popUp.closeAnyOpened();
  }


  static double _getVerticalPosition(BuildContext context){
    double screenHeight = AppScreen(context).height;

    // At the bottom of screen,
    // position is above button
    double verticalPosition = screenHeight - (140);

    return verticalPosition;
  }

  static double _getHorizontalPosition(BuildContext context){
    double screenWidth = AppScreen(context).width;

    double horizontalPosition = (screenWidth - 200) / 2;

    return horizontalPosition;
  }

}