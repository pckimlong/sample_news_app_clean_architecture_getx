import 'package:get/get.dart';
import '../../../../data/repository/news_repos_impl.dart';
import '../../../../domain/repository/news_repository.dart';
import '../../../../domain/usecase/get_news_usecase.dart';
import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NewsRepository>(NewsReposImpl(apiDataSource: Get.find()));
    Get.put<GetNewsUseCase>(GetNewsUseCaseImpl(newsRepository: Get.find()));
    Get.put<HomeController>(HomeController(getNewsUseCase: Get.find()));
  }
}
