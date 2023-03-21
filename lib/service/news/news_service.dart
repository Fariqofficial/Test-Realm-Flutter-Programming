// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:test_android_programming_apps/models/news/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_android_programming_apps/shared/shared_values.dart';

class NewsService {
  Future<List<ArticleModel>> getNewsByQuery(String query) async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/everything?q=$query&apikey=$apiKey',
        ),
      );

      print(res.toString());

      if (res.statusCode == 200) {
        return List<ArticleModel>.from(jsonDecode(res.body)['articles'].map(
          (article) => ArticleModel.fromJson(article),
        )).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
