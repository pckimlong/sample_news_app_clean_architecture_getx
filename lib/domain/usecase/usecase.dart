abstract class BaseUseCase<TResult, TParams> {
  Future<TResult> call(TParams params);
}

class UseCaseResult {
  final Exception? exception;
  UseCaseResult({
    required this.exception,
  });

  bool get isSuccess => exception == null;
}
