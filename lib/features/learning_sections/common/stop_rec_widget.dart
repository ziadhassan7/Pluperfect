import 'package:flutter/material.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';

class StopRecWidget extends StatelessWidget {
  const StopRecWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, height: 80,
      decoration: CustomDecoration(
        backgroundColor: const Color.fromRGBO(48, 74, 142, 1),
        radius: 1000,
        isCircular: true,
      ),

      child: Center(
        child: Container(
          width: 15, height: 15,
          decoration: CustomDecoration(
            backgroundColor: const Color.fromRGBO(163, 179, 222, 1),
            radius: 18,
          ),
        ),
      )
    );
  }
}
