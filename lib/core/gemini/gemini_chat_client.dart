import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gemini/src/models/candidates/candidates.dart';


class GeminiChatClient {

  static final _gemini = Gemini.instance;
  static List<Content> content = [];



  static Future<String?> openChatRequest(String initialMessage){
    content = [];
    return postChatRequest(initialMessage);
  }


  /// Chat
  static Future<String?> postChatRequest(String input) async {

    // Add user input to the chat list
    content.add(
      Content(parts: [
        Parts(text: input)],
          role: 'user'),
    );

    // Get reply
    Candidates? candidate = await _getChatAnswer(content);

    // Add AI input to the chat list
    if(candidate != null){
      if(candidate.content != null){
        content.add(candidate.content!);
      }
    }

    return candidate?.output; // return text answer
  }


  static Future<Candidates?> _getChatAnswer(List<Content> input){
    return _gemini.chat(input);
  }

}