import 'package:flutter/material.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';

class MicWidget extends StatelessWidget {
  const MicWidget({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 63, height: 63,
        decoration: CustomDecoration(
          backgroundColor: color,
          radius: 1000,
          isCircular: true,
        ),

        child: const Center(child: Icon(Icons.mic, color: white, size: 36,)),
    );
  }
}
