import 'dart:ui';
import 'package:pluperfect/core/constants/colors.dart';

class ColorTheme {

  //--
  static bool isDark = false;

  //call this on your main class, (upon state change)
  static setGlobalTheme({required bool isDarkTheme}) => isDark = isDarkTheme;


  //--
  static Color get background {
    return isDark ? backgroundDark : backgroundLight;
  }

  static Color get onBackground {
    return isDark ? onBackgroundDark : onBackgroundLight;
  }

  static Color get text {
    return isDark ? white : black;
  }



  static Color get read {
    return isDark ? readDark : readLight;
  }

  static Color get hear {
    return isDark ? hearDark : hearLight;
  }

  static Color get criticalThinking {
    return isDark ? criticalDark : criticalLight;
  }

  static Color get chat {
    return isDark ? chatDark : chatLight;
  }

  static Color get blue {
    return isDark ? chatDark : blue2Light;
  }

  static Color get yellow {
    return isDark ? yellowDark : yellowLight;
  }


  static Color get red {
    return isDark ? criticalDark : criticalPop;
  }

  static Color get accent {
    return  isDark ? white : accentColor;
  }
}