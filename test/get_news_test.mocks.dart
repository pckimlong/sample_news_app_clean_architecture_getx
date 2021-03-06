// Mocks generated by Mockito 5.0.10 from annotations
// in news_flutter/test/get_news_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:news_flutter/domain/entities/news_respone.dart' as _i2;
import 'package:news_flutter/domain/repository/news_repository.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeNewsRespone extends _i1.Fake implements _i2.NewsRespone {}

/// A class which mocks [NewsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsRepository extends _i1.Mock implements _i3.NewsRepository {
  MockNewsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.NewsRespone> getNews() =>
      (super.noSuchMethod(Invocation.method(#getNews, []),
              returnValue: Future<_i2.NewsRespone>.value(_FakeNewsRespone()))
          as _i4.Future<_i2.NewsRespone>);
}
