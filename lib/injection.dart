import 'package:pluperfect/features/learning_sections/common/hear_user_input_controller.dart';
import 'package:pluperfect/core/dotenv/dotenv_client.dart';
import 'package:pluperfect/core/gemini/gemini_client.dart';
import 'package:pluperfect/core/record_audio/recorder_client.dart';
import 'package:pluperfect/core/text_to_speech/text_to_speech_client.dart';
import 'package:pluperfect/core/translate/translate_util.dart';
import 'core/app_widgets/text_view/default_font.dart';
import 'core/app_widgets/text_view/custom_text.dart';
import 'core/hive/hive_client.dart';
import 'core/openai/openai_client.dart';

Future<void> init() async {

  //load the .env file
  await DotEnvClient.init();

  //init translation
  await TranslateUtil.init();

  //Set default font
  TextViewInit.setDefaultFont(FontFamily.sansation);

  //init Hive (Shared Pref)
  await HiveClient.globalInitialize();

  //Init chat clients
  GeminiClient.init();
  OpenAIClient.init();

  //Init TTS (TextToSpeech)
  TTSClient.init();

  //Check for Permissions:
  await RecorderClient.checkPermission();

  //Initiate audio file
  await HearUserInputController.initAudioFilePath();
}