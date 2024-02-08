import 'dart:io';
import 'package:mime/mime.dart';
import 'package:dio/dio.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import '../convertBase64.dart';
import '../custom_log.dart';
import '../dio/api_provider.dart';
import '../dotenv/dotenv_client.dart';

class AzureSpeech {

  static const String _baseUrl = "https://westeurope.stt.speech.microsoft.com";
  static const String _speechEndpoint = "/speech/recognition/conversation/cognitiveservices/v1";

  /// Use Quotable Api
  static final DioClient _dio = DioClient(_baseUrl);


  /// [audioFile] audio file
  /// [referenceText] reference text to compare with
  /// [GradingSystem] Either: HundredMark or FivePoint
  /// [Granularity] Either:
  /// Phoneme, which shows the score on the full-text, word, and phoneme levels.
  /// Word, which shows the score on the full-text and word levels.
  /// FullText, which shows the score on the full-text level only.
  /// [Dimension] Either:
  /// Basic, which shows the accuracy score only.
  /// Comprehensive, which shows scores on more dimensions (for example, fluency score and completeness score on the full-text level, and error type on the word level).
  /// [EnableMiscue] compare to reference text
  static Future<AzureModel> getTranscription({
        required File audioFile,
        String? referenceText,
        GradingSystem gradingSystem = GradingSystem.HundredMark,
        Granularity granularity = Granularity.Word,
        Dimension dimension = Dimension.Comprehensive,
        bool enableMiscue = true
      }) async {

    try {
      Response response = await _dio.post(
          _speechEndpoint,
          queryParameters: {
            'language': 'en-US'
          },
          options: Options(
              contentType: lookupMimeType(audioFile.path),
              headers: {
                'Ocp-Apim-Subscription-Key':DotEnvClient.azure,
                'Pronunciation-Assessment': getBase64({
                  "ReferenceText": referenceText,
                  "GradingSystem": gradingSystem.name,
                  "Granularity": granularity.name,
                  "Dimension": dimension.name,
                  "EnableMiscue": enableMiscue
                })
              }
          ),

          data: audioFile.readAsBytesSync() //stream
      );

      //print the response
      Log.p(response.data.toString());

      return AzureModel.fromJson(response.data);

    } catch (e) {
      Log("Azure Speech", e.toString());
      rethrow;
    }
  }
}


enum GradingSystem {
  HundredMark,
  FivePoint
}

enum Granularity {
  Phoneme,
  Word,
  FullText
}

enum Dimension {
  Basic,
  Comprehensive
}