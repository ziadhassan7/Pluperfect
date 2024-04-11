import 'package:flutter/material.dart';
import 'views/pop_up_word_view.dart';

class ContextMenu{

  static OverlayEntry? current;
  static late double _verticalPosition;
  static late double _horizontalPosition;

  static void show(BuildContext context, TapUpDetails details, String word) {
    current?.remove();

    final OverlayState overlayState = Overlay.of(context);

    // set position to variables
    _setPosition(context, details);

    // widget
    current = OverlayEntry(
      builder: (context) => Positioned(
        top: _verticalPosition,
        left: _horizontalPosition,

        child: PopUpWordView(selectedText: word,),
      ),
    );
    overlayState.insert(current!);
  }


  static _setPosition(context, TapUpDetails details){
    _verticalPosition = details.globalPosition.dy - 80;
    _horizontalPosition = details.localPosition.dx;

    // At the top of screen,
    // position is under text
    _verticalPosition = _verticalPosition + (120);

    // Break point is position 125
    if(_horizontalPosition > 150) {
      _horizontalPosition = 125;
    }

  }

  static close(){
    ContextMenu.current?.remove();
    ContextMenu.current = null;
  }

}