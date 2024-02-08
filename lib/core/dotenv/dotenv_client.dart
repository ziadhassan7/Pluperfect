import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvClient {

  //DO NOT forget to call await when you use this function
  static init() async {
    // To load the .env file contents into dotenv
    await dotenv.load(fileName: ".env");
  }

  static get gemini => dotenv.env['GEMINI_API_KEY'];
  static get openAi => dotenv.env['OPENAI_API_KEY'];
  static get azure => dotenv.env['AZURE_API_KEY'];
}