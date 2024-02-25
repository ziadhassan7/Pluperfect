import 'package:flutter/material.dart';

class AppRouter {

  /// Navigate to new screen
  static void navigateTo(BuildContext context, Widget screen, {bool replace = false, bool deleteAll = false}){
    if(!deleteAll){
      if (replace) {
        _replaceWithScreen(context, screen);
      } else {
        _goToScreen(context, screen);
      }

    } else {
      _removeUntilScreen(context, screen);
    }
  }


  static _goToScreen(context, screen){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen));
  }

  static _replaceWithScreen(context, screen){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen));
  }

  static _removeUntilScreen(context, screen){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

}