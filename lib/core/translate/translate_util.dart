import 'package:pluperfect/core/hive/shared_pref/languages_pref.dart';
import 'package:translator_plus/translator_plus.dart';

class TranslateUtil {

  static final _translator = GoogleTranslator();

  static Future<String> translate(String text,) async {

    // Get Current Language
    String source = _getSourceLangCode();
    String to = _getToLangCode();

    // Translate
    var translation2 = await _translator.translate(text, from: 'auto', to: 'ar');

    print("Loook $translation2");

    return translation2.text;
  }

  //Fire up translation
  static init() async {
    await _translator.translate(".", from: "en", to: "en");
  }

  static _getSourceLangCode(){
    LanguageCode langCode = LanguagePref.getLearningLanguage();
    return langCode.name;
  }

  static _getToLangCode(){
    TranslationLang langCode = LanguagePref.getTranslatingLanguage();
    return langCode.name;
  }

}