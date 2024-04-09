import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/app_screen.dart';
import 'views/pop_up_mic_warning_view.dart';

class ContextMenu{

  static OverlayEntry? current;
  static late double _verticalPosition;
  static late double _horizontalPosition;

  static void show(BuildContext context,) {
    current?.remove();

    final OverlayState overlayState = Overlay.of(context);

    // set position to variables
    _setPosition(context,);

    // widget
    current = OverlayEntry(
      builder: (context) => Positioned(
        top: _verticalPosition,
        left: _horizontalPosition,

        child: PopUpMicWarningView(),
      ),
    );
    overlayState.insert(current!);
  }


  static _setPosition(context,){
    double screenHeight = AppScreen(context).height;
    double screenWidth = AppScreen(context).width;

    _verticalPosition = screenHeight;
    _horizontalPosition = (screenWidth - 200) / 2;

    // At the bottom of screen,
    // position is above button
    _verticalPosition = _verticalPosition - (140);

  }

  static close(){
    ContextMenu.current?.remove();
    ContextMenu.current = null;
  }

}