import 'package:damodi_daily_mood_diary/models/quote_model.dart';
import 'package:dio/dio.dart';

class QuoteApi {
  static const String _url = 'https://api.quotable.io/random';
  static const String _parameter = 'happiness';

  final Dio _dio = Dio();

  Future<QuoteModel> getQuote() async {
    try {
      final response = await _dio.get(
        _url,
        queryParameters: {
          'tags': _parameter,
        },
      );

      return QuoteModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load quote : $e');
    }
  }
}
