import 'package:get/get.dart';

class ApiDataSource extends GetConnect {
  static const url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=(KEY)'; //TODO config Key

  Future<Response> getNewsRes() async {
    return await get(url);
  }
}
