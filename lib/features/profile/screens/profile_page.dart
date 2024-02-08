import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/bloc_color_theme.dart';
import 'package:pluperfect/core/localization/localization.dart';
import 'package:pluperfect/features/profile/views/settings_item_switch.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Column(
        children: [

          const SizedBox(height: 50,),

          SettingsItemSwitch(
              title: 'LocalTxt.darkMode',
              iconPath: 'assets/dark_mode.svg',
              onTap: (newValue) {
                context.read<ThemeCubit>().switchThemeTo(isDark: newValue);
              }
          ),
        ],
      ),
    );
  }
}
