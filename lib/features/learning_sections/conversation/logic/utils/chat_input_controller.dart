import 'package:pluperfect/core/constants/ai_requests.dart';
import '../../../../../../../core/gemini/gemini_client.dart';

class ChatInputController {


  static Future<String?> openChat() async {

    return GeminiClient.openChat(ChatOpener.english);
  }


  static Future<String?> getChatAnswer(String input) async {

    return await GeminiClient.chat(input);
  }

}