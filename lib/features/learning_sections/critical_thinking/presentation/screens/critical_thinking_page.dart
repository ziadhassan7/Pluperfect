import 'package:flutter/material.dart';
import 'package:pluperfect/features/learning_sections/common/mic/view/mic_button.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/views/question_box.dart';

class CriticalThinkingPage extends StatelessWidget {
  const CriticalThinkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuestionBox(),

        const MicButton(),
      ]
    );
  }
}
