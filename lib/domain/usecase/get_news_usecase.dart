import '../entities/news_respone.dart';
import '../repository/news_repository.dart';
import 'usecase.dart';

abstract class GetNewsUseCase extends BaseUseCase<GetNewsResult, void> {}

class GetNewsUseCaseImpl extends GetNewsUseCase {
  final NewsRepository _repository;

  GetNewsUseCaseImpl({
    required NewsRepository newsRepository,
  }) : _repository = newsRepository;

  @override
  Future<GetNewsResult> call(void noParams) async {
    try {
      return GetNewsResult(news: await _repository.getNews());
    } on Exception catch (e) {
      return GetNewsResult(news: NewsRespone.empty(), exception: e);
    }
  }
}

class GetNewsResult extends UseCaseResult {
  final NewsRespone news;
  final Exception? exception;
  GetNewsResult({
    required this.news,
    this.exception,
  }) : super(exception: exception);
}
