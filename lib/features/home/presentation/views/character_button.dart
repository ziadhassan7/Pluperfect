import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/constants/characters/cool_char.dart';
import 'package:pluperfect/core/localization/localization.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/padding.dart';

class CharacterButton extends StatelessWidget {
  const CharacterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const CustomPadding(top: 24, right: 24, left: 24),
      decoration: CustomDecoration(
        radius: 36,
        backgroundColor: const Color(0xFFE1E3D2),
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(LocalTxt.characterCustomizationTitle, scale: TypeScale.headline3,),
          
          const SizedBox(height: 24,),

          SizedBox(
            width: double.infinity,
            height: 150,
            child: Stack(
              children: [
                Positioned(
                  right: 18,
                  bottom: -40, // Offset the widget
                  child: SvgPicture.string(coolChar, height: 190,),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
