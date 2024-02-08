import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/box_decoration.dart';
import 'package:pluperfect/core/styles/padding.dart';
import '../../../core/hive/shared_pref/theme_pref.dart';
import '../../../core/styles/color_theme.dart';

class SettingsItemSwitch extends StatefulWidget {
  const SettingsItemSwitch({super.key, required this.title, required this.iconPath, required this.onTap});
  
  final String title;
  final String iconPath;
  final Function(bool) onTap;

  @override
  State<SettingsItemSwitch> createState() => _SettingsItemSwitchState();
}

class _SettingsItemSwitchState extends State<SettingsItemSwitch> {
  late bool isDark;

  @override
  void initState() {
    isDark = getInitialTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 8, horizontal: 24),

      child: Container(
        padding: const CustomPadding(vertical: 14, horizontal: 24),
        decoration: CustomDecoration(
          backgroundColor: ColorTheme.onBackground, radius: 18,
        ),

        child: Row(
          children: [

            //icon
            SvgPicture.asset(widget.iconPath, color: ColorTheme.text,),

            const SizedBox(width: 18,),

            //title
            TextView(widget.title, weight: FontWeight.bold, color: ColorTheme.text,),

            const Spacer(),

            //Switch button
            Switch(value: isDark, onChanged: (newValue){
              setState(() {
                isDark = newValue;
                widget.onTap(newValue);
              });
            })

          ],
        ),
      ),
    );
  }

  bool getInitialTheme(){
    return ThemePref.getTheme();
  }
}
