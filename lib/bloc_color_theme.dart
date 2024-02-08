import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/hive/shared_pref/theme_pref.dart';


class ThemeCubit extends Cubit<bool>{
  ThemeCubit() : super(getDefaultColor()); //light theme

  static bool getDefaultColor(){
    return ThemePref.getTheme();
  }


  toggleTheme() {
    bool isDark = ThemePref.getTheme();

    ThemePref.updateTheme(!isDark);
    emit(!isDark);
  }


  switchToLight(){
    ThemePref.updateTheme(false);
    emit(false); //light theme
  }

  switchToDark(){
    ThemePref.updateTheme(true);
    emit(true); //dark theme
  }

  switchThemeTo({required bool isDark}){
    ThemePref.updateTheme(isDark);
    emit(isDark);
  }
}
