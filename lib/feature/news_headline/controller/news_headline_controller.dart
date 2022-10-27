import 'package:get/get.dart';
import 'package:getx/core/model/article.dart';
import 'package:getx/core/repository/news_repo_impl.dart';
import 'package:getx/core/repository/news_repository.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxList<Article> articles = <Article>[].obs;

  RxBool isLoading = false.obs;

  loadNewsLine() async {
    showLoading();

    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No data received");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
