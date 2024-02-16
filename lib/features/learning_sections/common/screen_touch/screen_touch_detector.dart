import 'package:flutter/material.dart';
import '../context_menu/context_menu.dart';

class ScreenTouchDetector extends StatelessWidget {
  const ScreenTouchDetector({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,

      onTap: () {
        //close any context menu opened
        ContextMenu.close();
      },

      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
