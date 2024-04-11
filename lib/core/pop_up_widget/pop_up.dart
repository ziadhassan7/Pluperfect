import 'package:flutter/cupertino.dart';

class PopUp {
  static OverlayEntry? current;
  final double verticalPosition;
  final double horizontalPosition;
  Widget widget;

  PopUp.show(BuildContext context,
      {required this.verticalPosition,
      required this.horizontalPosition,
      required this.widget}) {


    closeAnyOpened();

    _assignCurrentWidget();

    //overlay current widget
    final OverlayState overlayState = Overlay.of(context);
    overlayState.insert(current!);
  }

  _assignCurrentWidget(){
    current = OverlayEntry(
      builder: (context) => Positioned(
        top: verticalPosition,
        left: horizontalPosition,
        child: widget,
      ),
    );
  }

  closeAnyOpened() {
    current?.remove();
    current = null;
  }
}
