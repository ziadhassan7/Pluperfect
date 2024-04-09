import 'package:dio/dio.dart';
import 'package:pluperfect/core/quotes/quotes_model.dart';
import '../../../../../../core/custom_log.dart';
import '../dio/api_provider.dart';

class QuotesClient {

  static const String _baseUrl = 'https://api.quotable.io';
  static const String _randomEndpoint = '/quotes/random';

  /// Use Weather Api
  static final DioClient _dio = DioClient(_baseUrl);

  // Get Today's weather from location
  static Future<QuoteModel> getQuote(int minLength, int maxLength) async {

    try {
      Response response = await _dio.get(
          _randomEndpoint,
          queryParameters: {
            "minLength": minLength,
            "maxLength": maxLength,
          }
      );

      return QuoteModel.fromJson(response.data);

    } catch (e) {
      Log("Quotes Client", e);
      rethrow;
    }
  }
}