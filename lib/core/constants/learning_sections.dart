import 'package:flutter/material.dart';
import '../../features/learning_sections/common/level_controller.dart';
import '../../features/learning_sections/conversation/presentation/screens/chat_page.dart';
import '../../features/learning_sections/practice/presentation/screens/practice_page.dart';
import '../localization/localization.dart';
import '../styles/color_theme.dart';

enum LearningSections {
  practicePage(
      page: PracticePage(Level.beginner)
  ),
  chatPage(
      page: ChatPage()
  );

  final Widget page;

  const LearningSections({required this.page});

  Color get buttonColor {
    switch(this){
      case LearningSections.practicePage:
        return ColorTheme.read;
      case LearningSections.chatPage:
        return ColorTheme.chat;
    }
  }

  Color get buttonPopColor {
    switch(this){
      case LearningSections.practicePage:
        return ColorTheme.violet;
      case LearningSections.chatPage:
        return ColorTheme.blue;
    }
  }

  String get title {
    switch(this){
      case LearningSections.practicePage:
        return LocalTxt.practiceSection;
      case LearningSections.chatPage:
        return LocalTxt.chatSection;
    }
  }

  String get description {
    switch(this){
      case LearningSections.practicePage:
        return LocalTxt.practiceSectionDescription;
      case LearningSections.chatPage:
        return LocalTxt.chatSectionDescription;
    }
  }
}