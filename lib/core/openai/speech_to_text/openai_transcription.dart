import 'package:path/path.dart' as p;
import 'package:dio/dio.dart';
import '../../dio/api_provider.dart';
import '../../custom_log.dart';
import '../../dotenv/dotenv_client.dart';

class OpenAISpeech {

  static const String _baseUrl = "https://api.openai.com/v1";
  static const String _endpoint = "/audio/transcriptions";

  /// Use Quotable Api
  static final DioClient _dio = DioClient(_baseUrl);

  /// [limit] number of random quotes to retrieve (min: 1, max: 50)
  /// [maxLength] The maximum Length in characters ( can be combined with minLength )
  /// [minLength] The minimum Length in characters ( can be combined with minLength )
  /// [tags] filter quotes by tags ( | => or) ( , => and)
  /// [author] author name or slang
  static Future<String> getText(String audioFilePath) async {

    try {
      Response response = await _dio.post(
          _endpoint,
          options: Options(
            headers: {
              'Content-Type':'multipart/form-data',
              'Authorization':'Bearer ${DotEnvClient.openAi}',
            }
          ),

          data: FormData.fromMap({
            'model': 'whisper-1',
            'file': await MultipartFile.fromFile(
                audioFilePath,
                filename: 'audio.${p.extension(audioFilePath)}'
            )
          })
      );

      Map responseBody = response.data;
      String result = responseBody['text'];
      return result;

    } catch (e) {
      Log("Open Ai Speech", e);
      rethrow;
    }
  }


}