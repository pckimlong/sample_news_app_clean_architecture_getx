import '../entities/news_respone.dart';

abstract class NewsRepository {
  Future<NewsRespone> getNews();
}
