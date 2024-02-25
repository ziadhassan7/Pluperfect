import 'package:flutter/material.dart';

class AppRouter {

  /// Navigate to new screen
  static void navigateTo(BuildContext context, Widget screen, {bool replace = false}){
    if (replace) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );

    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
  }


}