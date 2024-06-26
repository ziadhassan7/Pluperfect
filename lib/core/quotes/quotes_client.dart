import 'package:dio/dio.dart';
import 'package:pluperfect/core/quotes/quotes_model.dart';
import '../../../../../../core/custom_log.dart';
import '../dio/api_provider.dart';

class QuotesClient {

  static const String _baseUrl = "https://api.quotable.io";
  static const String _randomEndpoint = "/quotes/random";

  /// Quotes Api
  static final DioClient _dio = DioClient(_baseUrl);

  // Get a random quote
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
      Log.p("Quotes Client $e");
      rethrow;
    }
  }
}