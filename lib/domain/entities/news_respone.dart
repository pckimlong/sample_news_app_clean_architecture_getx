import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'article.dart';

class NewsRespone extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;
  NewsRespone({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsRespone.empty({
    this.articles = const [],
    this.totalResults = 0,
    this.status = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsRespone.fromMap(Map<String, dynamic> map) {
    return NewsRespone(
      status: map['status'],
      totalResults: map['totalResults'],
      articles:
          List<Article>.from(map['articles'].map((x) => Article.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsRespone.fromJson(String source) =>
      NewsRespone.fromMap(json.decode(source));

  @override
  List<Object> get props => [status, totalResults, articles];
}
