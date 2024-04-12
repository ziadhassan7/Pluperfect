import 'package:flutter/material.dart';
import 'package:pluperfect/core/pop_up_widget/pop_up.dart';
import 'views/pop_up_word_view.dart';

class PopUpWord{

  static PopUp? _popUp;

  static void show(BuildContext context, TapUpDetails details, String word) {
    _popUp = PopUp.show(context,
        verticalPosition: _getVerticalPosition(details),
        horizontalPosition: _getHorizontalPosition(details),
        widget: PopUpWordView(selectedText: word,));

  }

  static close(){
    if(_popUp != null) _popUp!.closeAnyOpened();
  }


  static double _getVerticalPosition(TapUpDetails details){
    double verticalPosition = details.globalPosition.dy + 20;

    return verticalPosition;
  }

  static double _getHorizontalPosition(TapUpDetails details){
    double horizontalPosition = details.globalPosition.dx - 40;

    // Break point is position 150
    if(horizontalPosition > 150) {
      horizontalPosition = 125;
    }

    return horizontalPosition;
  }

}