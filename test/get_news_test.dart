import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news_flutter/domain/entities/news_respone.dart';
import 'package:news_flutter/domain/repository/news_repository.dart';
import 'package:news_flutter/domain/usecase/get_news_usecase.dart';

import 'get_news_test.mocks.dart';

@GenerateMocks([NewsRepository])
void main() {
  late NewsRepository _repository;
  late GetNewsUseCase _useCase;

  setUp(() {
    _repository = MockNewsRepository();
    _useCase = GetNewsUseCaseImpl(newsRepository: _repository);
  });

  test(
    "Should return news",
    () async {
      final news = NewsRespone.empty();

      when(_repository.getNews()).thenAnswer((realInvocation) async => news);

      final result = await _useCase.call(null);

      expect(result.news, NewsRespone.empty());
      expect(result.isSuccess, true);
    },
  );
  test(
    "Should faild return empty news response",
    () async {
      when(_repository.getNews()).thenThrow(Exception());

      final result = await _useCase.call(null);

      expect(result.news, NewsRespone.empty());
      expect(result.isSuccess, false);
    },
  );
}
