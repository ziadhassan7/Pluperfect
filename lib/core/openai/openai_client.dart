import 'package:dart_openai/dart_openai.dart';
import 'package:pluperfect/core/dotenv/dotenv_client.dart';
import 'package:pluperfect/core/openai/chat_controller/openai_controller.dart';
import 'package:pluperfect/core/openai/speech_to_text/openai_transcription.dart';

import '../custom_log.dart';


/// Stream Chat Response
/// [temperature] adding Randomness to the Responses
/// [seed] repeated requests with the same seed should return the same result.
/// Do not use it if you want variety in answers!
/// [n] represents how much chat completion choices to generate for each input message
/// Note that you will be charged based on the number of generated tokens across all of the choices.
/// Keep n as 1 to minimize costs.
/// [maxTokens] limit response tokens
/// more: https://medium.com/nerd-for-tech/model-parameters-in-openai-api-161a5b1f8129

class OpenAIClient {

  static final OpenAIController _controller = OpenAIController();

  // Initializes the package with the API key
  static init(){
    OpenAI.apiKey = DotEnvClient.openAi;
    OpenAI.requestsTimeOut = const Duration(seconds: 30); //default
    OpenAI.showLogs = true;
    OpenAI.showResponsesLogs = true;
  }

  // Add the new assistance response
  void addAssistantResponse(String response) => _controller.addAssistantResponse(response);


  ///                                                                           / Normal Response
  static Future<String?> getNormalResponse(String prompt) async {

    // the user message that will be sent to the request.
    final promptMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt),
      ],
      role: OpenAIChatMessageRole.user,
    );

    final chatResponse = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      /*model: "gpt-3.5-turbo-1106",
      responseFormat: {"type": "json_object"},*/
      messages: [promptMessage],
      n: 1,
      maxTokens: 256,
    );

    return chatResponse.choices.first.message.content?.first.text;
  }

  ///                                                                           / Chat

  /// Chat (Normal Response)
  static Future<String?> openChat(String initialMessage){
    _controller.resetMessages();
    _controller.addUserMessage(initialMessage);

    return _sendChatRequest();
  }

  static Future<String?> chat(String input){
    _controller.addUserMessage(input);

    return _sendChatRequest();
  }


  static Future<String?> _sendChatRequest() async {
    final chatResponse = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      /*model: "gpt-3.5-turbo-1106",
      responseFormat: {"type": "json_object"},*/
      messages: _controller.messages,
      n: 1,
      maxTokens: 256,
    );

    return chatResponse.choices.first.message.content?.first.text;
  }



  /// Chat (Stream)
  static Stream<OpenAIStreamChatCompletionModel> openChatStream(String initialMessage){
    _controller.resetMessages();
    _controller.addUserMessage(initialMessage);

    return _sendChatRequestStream();
  }



  static Stream<OpenAIStreamChatCompletionModel> chatStream(String input){
    _controller.addUserMessage(input);

    return _sendChatRequestStream();
  }


  static Stream<OpenAIStreamChatCompletionModel> _sendChatRequestStream(){
    final chatStream = OpenAI.instance.chat.createStream(
      model: "gpt-3.5-turbo",
      messages: _controller.messages,
      n: 1,
      maxTokens: 256,
    );

    return chatStream;
  }


  ///                                                                           / Speech To Text
  static Future<String> speechToText(String audioFilePath) async {
    String text = await OpenAISpeech.getText(audioFilePath);

    Log("Speech to Text Results:", text);

    return text;
  }


  ///                                                                           / System Task
  static Future<String?> getSystemTask(String system, String prompt) async {

    _controller.addSystemGuide(system); //system
    _controller.addUserMessage(prompt); //message

    final chatResponse = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: _controller.messages,
      n: 1,
      maxTokens: 256,
    );

    _controller.resetMessages(); //reset

    return chatResponse.choices.first.message.content?.first.text;
  }

}