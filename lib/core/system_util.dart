import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluperfect/core/styles/color_theme.dart';

class SystemUtil {

  /// Screen Orientation
  static setScreenOnlyPortrait(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static setScreenOnlyLandscape(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }

  static setScreenAllOrientation(){
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }

  // Get orientation
  static bool isScreenLandscape(BuildContext context){
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  /// Status bar
  static void disableStatusBarColor () {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For IOS (dark icons)
    ));
  }

  static void updateStatusBarColor() {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: ColorTheme.background,

      statusBarIconBrightness:
      ColorTheme.isDark ? Brightness.light : Brightness.dark, // For Android

      statusBarBrightness:
      ColorTheme.isDark ? Brightness.dark : Brightness.light, // For IOS
    ));
  }

}