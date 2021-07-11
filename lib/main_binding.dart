import 'package:get/get.dart';
import 'data/datasource/api_datasource.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiDataSource());
  }
}
