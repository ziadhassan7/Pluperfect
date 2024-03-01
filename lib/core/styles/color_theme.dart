import 'package:pluperfect/core/constants/colors.dart';

class ColorTheme {

  //--
  static bool isDark = false;

  //call this on your main class, (upon state change)
  static setGlobalTheme({required bool isDarkTheme}) => isDark = isDarkTheme;


  //--
  static get background {
    return isDark ? backgroundDark : backgroundLight;
  }

  static get onBackground {
    return isDark ? onBackgroundDark : onBackgroundLight;
  }

  static get text {
    return isDark ? white : black;
  }



  static get read {
    return isDark ? readDark : readLight;
  }

  static get hear {
    return isDark ? hearDark : hearLight;
  }

  static get criticalThinking {
    return isDark ? criticalDark : criticalLight;
  }

  static get chat {
    return isDark ? chatDark : chatLight;
  }

  static get blue2 {
    return isDark ? blue2Dark : blue2Light;
  }

  static get yellow {
    return isDark ? yellowDark : yellowLight;
  }



  static get violet {
    return isDark ? violetDark : violetLight;
  }

  static get green {
    return isDark ? greenDark : greenLight;
  }

  static get blue {
    return isDark ? blueDark : blueLight;
  }

  static get red {
    return isDark ? redDark : redLight;
  }


  static get accent {
    return  isDark ? white : accentColor;
  }
}