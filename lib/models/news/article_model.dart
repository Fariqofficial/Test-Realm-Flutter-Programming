// ignore_for_file: prefer_if_null_operators

import 'package:test_android_programming_apps/models/news/source_model.dart';

class ArticleModel {
  final SourceModel? data;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  ArticleModel({
    this.data,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        data: json['source'] == null
            ? null
            : SourceModel.fromJson(json['source']),
        author: json['author'] == null ? null : json['author'],
        title: json['title'],
        description: json['description'] == null ? null : json['description'],
        url: json['url'] == null ? null : json['url'],
        urlToImage: json['urlToImage'] == null ? null : json['urlToImage'],
        publishedAt: DateTime.tryParse(json['publishedAt']),
        content: json['content'] == null ? null : json['content'],
      );
}
