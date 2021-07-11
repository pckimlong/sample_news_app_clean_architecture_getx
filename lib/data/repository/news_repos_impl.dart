import '../datasource/api_datasource.dart';
import '../../domain/entities/news_respone.dart';
import '../../domain/repository/news_repository.dart';

class NewsReposImpl extends NewsRepository {
  final ApiDataSource _api;

  NewsReposImpl({
    required ApiDataSource apiDataSource,
  }) : _api = apiDataSource;

  @override
  Future<NewsRespone> getNews() async {
    final response = await _api.getNewsRes();
    if (response.statusCode == 200) {
      return NewsRespone.fromMap(response.body);
    } else {
      return NewsRespone.empty();
    }
  }
}
