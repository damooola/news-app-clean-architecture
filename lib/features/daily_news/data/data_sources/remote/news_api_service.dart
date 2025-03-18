import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';

class NewsApiService {
  final String _baseUrl = newsApiBaseUrl;

  Future<List<ArticleModel>> getNewsArticles({
    String? apiKey,
    String? country,
    String? category,
  }) async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/top-headlines?country=$country&apiKey=$apiKey&category=$category'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['articles'];
      return jsonData.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
