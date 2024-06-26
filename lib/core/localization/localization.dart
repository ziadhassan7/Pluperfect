import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';


enum Locals {
  en, ar
}

class LocalTxt {

  //Buttons
  static final String homeButton = tr('home_button');
  static final String bookmarksButton = tr('bookmarks_button');
  static final String profileButton = tr('profile_button');

  static final String closeButton = tr('close_button');
  static final String translateButton = tr('translate_button');
  static final String saveButton = tr('save_button');
  static final String speakerButton = tr('speaker_button');

  //Dictionary
  static final String dictionaryWidget = tr('dictionary_widget');
  static final String dictionaryPageTitle = tr('dictionary_page_title');

  //Home Screen widgets
  static final String characterCustomizationTitle = tr('character_customization_title');

  //Learning Sections
  static final String practiceSection = tr('practice_section');
  static final String chatSection = tr('chat_section');

  static final String practiceSectionDescription = tr('practice_section_description');
  static final String chatSectionDescription = tr('chat_section_description');

  //Dialogs
  static final String addNewWordDialogTitle = tr('add_new_word_dialog_title');
  static final String addNewWordDialogButton = tr('add_new_word_dialog_button');

  static final String deleteWordDialogTitle = tr('delete_word_dialog_title');
  static final String deleteWordDialogButton = tr('delete_word_dialog_button');


  //Settings
  static final String darkMode = tr('dark_mode');


//or you can use:
//'title'.tr()
}


class LocalizationHandler {

  static changeLocalToArabic(BuildContext context){
    context.setLocale(const Locale('ar'));
  }


  static Locale getCurrentLocal(BuildContext context){
    return context.locale;
  }


  static Locale getLocalFromEnum(Locals local){

    switch (local){

      case Locals.en:
        return const Locale('en');
      case Locals.ar:
        return const Locale('en');
    }
  }
}