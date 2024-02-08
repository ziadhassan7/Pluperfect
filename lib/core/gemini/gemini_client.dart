import 'dart:typed_data';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gemini/src/models/candidates/candidates.dart';
import 'package:pluperfect/core/dotenv/dotenv_client.dart';
import 'package:pluperfect/core/gemini/gemini_chat_client.dart';

class GeminiClient {

  static final _gemini = Gemini.instance;

  static init(){
    Gemini.init(apiKey: DotEnvClient.gemini);
  }

  /// Stream Output
  /// To speed up interactions, you can instantly listen to the
  /// streamed output.
  static Stream<Candidates> getStreamGenerateOutput(String input){
    return _gemini.streamGenerateContent(input);
  }


  /// Text-Only Input
  /// This feature lets you perform natural language processing (NLP) tasks
  /// such as text completion and summarization.
  static Future<String?> textOnly(String input) async {
    Candidates? candidate = await _gemini.text(input);

    return candidate?.content?.parts?.first.text;
  }


  /// Text & Image Input
  /// If the input contains both text and image, You can send a text prompt
  /// with an image to the gemini-pro-vision model to perform
  /// a vision-related task.
  /// For example, captioning an image or identifying what's in an image.
  static Future<Candidates?> textAndImage(String input, List<Uint8List> imageInput){
    return _gemini.textAndImage(
        text: input, /// text
        images: imageInput /// list of images
    );
  }

  /// Multi-turn conversations (chat)
  /// Using Gemini, you can build freeform conversations across multiple turns.

  static Future<String?> openChat(String initialMessage){
    return GeminiChatClient.openChatRequest(initialMessage);
  }

  static Future<String?> chat(String input) async {
    return await GeminiChatClient.postChatRequest(input);
  }

}