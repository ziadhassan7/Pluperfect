import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../constants/hive_keys.dart';
import '../hive_client.dart';

class ThemePref {

  static final Box _hiveBox = HiveClient.instance.globalBox;


  static Future<void> updateTheme(bool isDark) async {

    await _hiveBox.put(IS_DARK, isDark);
  }

  static bool getTheme() {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

    return _hiveBox.get(IS_DARK, defaultValue: (brightness == Brightness.dark)); //get system default
  }

}