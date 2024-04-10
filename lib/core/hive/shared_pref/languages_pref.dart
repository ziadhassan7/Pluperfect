import 'package:hive_flutter/adapters.dart';
import 'package:pluperfect/core/hive/hive_client.dart';
import '../../constants/hive_keys.dart';

enum LanguageCode {
  en,
  gr,
  fr,
  it,
  ch
}

enum TranslationLang {
  ar
}

class LanguagePref{

  static final Box _hiveBox = HiveClient.instance.globalBox;


  ///                                                                           / App Language
  static Future<void> updateAppLanguage() async {
    LanguageCode en = LanguageCode.en;
    await _hiveBox.put(APP_LANGUAGE, en);
  }

  static LanguageCode getAppLanguage() {
    return _hiveBox.get(APP_LANGUAGE, defaultValue: LanguageCode.en);
  }

  ///                                                                           / Translating Language
  static Future<void> updateTranslatingLanguage() async {
    TranslationLang ar = TranslationLang.ar;
    await _hiveBox.put(TRANSLATING_LANGUAGE, ar);
  }

  static TranslationLang getTranslatingLanguage() {
    return _hiveBox.get(TRANSLATING_LANGUAGE, defaultValue: TranslationLang.ar);
  }

}