import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gemini/src/models/candidates/candidates.dart';
import '../custom_log.dart';


class GeminiChatClient {

  static final _gemini = Gemini.instance;
  static List<Content> content = [];


  static Future<String?> openChatRequest(String initialMessage){
    try{
      content = [];
      return postChatRequest(initialMessage);

    } catch (e){
      Log.p("Gemini - openChatRequest: $e");
      rethrow;
    }
  }


  /// Chat
  static Future<String?> postChatRequest(String input) async {
    try {
      // Add user input to the chat list
      content.add(
        Content(parts: [Part.text(input)], role: 'user'),
      );

      // Get reply
      Candidates? candidate = await _getChatAnswer(content);

      // Add AI input to the chat list
      if (candidate != null) {
        if (candidate.content != null) {
          content.add(candidate.content!);
        }
      }

      return candidate?.output; // return text answer

    } catch (e){
      Log.p("Gemini - postChatRequest: $e");
      rethrow;
    }
  }


  static Future<Candidates?> _getChatAnswer(List<Content> input){
    try {
      return _gemini.chat(input);

    } catch (e){
      Log.p("Gemini - getChatAnswer: $e");
      rethrow;
    }
  }

}