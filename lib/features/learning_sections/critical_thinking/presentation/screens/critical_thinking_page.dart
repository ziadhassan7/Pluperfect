import 'package:flutter/material.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/views/question_box.dart';
import '../../../common/azure_mic/view/azure_mic_button.dart';

class CriticalThinkingPage extends StatelessWidget {
  const CriticalThinkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuestionBox(),

        AzureMicButton(onResponse: (userInput){},),
      ]
    );
  }
}
