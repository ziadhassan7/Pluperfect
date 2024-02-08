import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';


enum Locals {
  en, ar
}

class LocalTxt {
  //Learning Sections
  static final String section1 = tr('section1');
  static final String section2 = tr('section2');
  static final String section3 = tr('section3');
  static final String section4 = tr('section4');

  static final String description1 = tr('description1');
  static final String description2 = tr('description2');
  static final String description3 = tr('description3');
  static final String description4 = tr('description4');

  static final String darkMode = tr('darkMode');


//or you can use:
//'title'.tr()
}


class LocalizationHandler {

  static changeLocalToArabic(BuildContext context){
    context.setLocale(const Locale('ar'));
  }




  Locale getLocal(Locals local){

    switch (local){

      case Locals.en:
        return const Locale('en');
      case Locals.ar:
        return const Locale('en');
    }

  }
}