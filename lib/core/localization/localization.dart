import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';


enum Locals {
  en, ar
}

class LocalTxt {

  //Buttons
  static final String homeButton = tr('home_button');
  static final String profileButton = tr('profile_button');

  static final String closeButton = tr('close_button');
  static final String translateButton = tr('translate_button');
  static final String saveButton = tr('save_button');
  static final String speakerButton = tr('speaker_button');

  //Dictionary
  static final String dictionaryWidget = tr('dictionary_widget');
  static final String dictionaryPageTitle = tr('dictionary_page_title');

  //Home Screen widgets
  static final String dailyMissionsTitle = tr('daily_missions_title');
  static final String dailyMissionsDescription = tr('dictionary_page_title');

  //Learning Sections
  static final String readSection = tr('read_section');
  static final String hearSection = tr('hear_section');
  static final String chatSection = tr('chat_section');
  static final String thinkingSection = tr('thinking_section');

  static final String description1 = tr('description1');
  static final String description2 = tr('description2');
  static final String description3 = tr('description3');
  static final String description4 = tr('description4');

  //Dialogs
  static final String addNewWordDialogTitle = tr('add_new_word_dialog_title');
  static final String addNewWordDialogButton = tr('add_new_word_dialog_button');

  static final String deleteWordDialogTitle = tr('delete_word_dialog_title');
  static final String deleteWordDialogButton = tr('delete_word_dialog_button');


  //Settings
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