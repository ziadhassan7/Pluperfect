import 'package:flutter/material.dart';
import '../../features/learning_sections/conversation/presentation/screens/chat_page.dart';
import '../../features/learning_sections/critical_thinking/presentation/screens/critical_thinking_page.dart';
import '../../features/learning_sections/hear/presentation/screens/hear_page.dart';
import '../../features/learning_sections/read/logic/utils/level_controller.dart';
import '../../features/learning_sections/read/presentation/screens/read_page.dart';
import '../localization/localization.dart';
import '../styles/color_theme.dart';

enum LearningSections {
  readPage(
      icon: "assets/symbols/read.svg",
      page: ReadPage(Level.beginner)
  ),
  hearPage(
      icon: "assets/symbols/hear.svg",
      page: HearPage()
  ),
  chatPage(
      icon: "assets/symbols/chat.svg",
      page: ChatPage()
  ),
  criticalPage(
      icon: "assets/symbols/critical_thinking.svg",
      page: CriticalThinkingPage()
  );

  final String icon;
  final Widget page;

  const LearningSections({required this.icon, required this.page});

  Color get buttonColor {
    switch(this){
      case LearningSections.readPage:
        return ColorTheme.read;
      case LearningSections.hearPage:
        return ColorTheme.hear;
      case LearningSections.chatPage:
        return ColorTheme.chat;
      case LearningSections.criticalPage:
        return ColorTheme.criticalThinking;
    }
  }

  Color get buttonPopColor {
    switch(this){
      case LearningSections.readPage:
        return ColorTheme.violet;
      case LearningSections.hearPage:
        return ColorTheme.green;
      case LearningSections.chatPage:
        return ColorTheme.blue;
      case LearningSections.criticalPage:
        return ColorTheme.red;
    }
  }

  String get title {
    switch(this){
      case LearningSections.readPage:
        return LocalTxt.readSection;
      case LearningSections.hearPage:
        return LocalTxt.hearSection;
      case LearningSections.chatPage:
        return LocalTxt.chatSection;
      case LearningSections.criticalPage:
        return LocalTxt.thinkingSection;
    }
  }
}