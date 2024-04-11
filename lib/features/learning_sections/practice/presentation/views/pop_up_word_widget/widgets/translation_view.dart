import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/padding.dart';

class TranslationView extends StatelessWidget {
  const TranslationView({super.key, required this.translation});

  final String translation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 12, horizontal: 12),

      child: Align(
          alignment: Alignment.topRight,
          child: TextView(translation, scale: TypeScale.arabic,)),
    );
  }
}
