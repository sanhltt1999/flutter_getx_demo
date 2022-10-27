import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/model/article.dart';
import '../../../core/repository/news_repo_impl.dart';
import '../../../core/repository/news_repository.dart';

class SearchNewsController extends GetxController {
  late NewsRepo _newsRepo;

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.isNotEmpty) {
        searchNewsHeadLine();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxList<Article> articles = RxList();

  RxBool isLoading = false.obs;

  searchNewsHeadLine() async {
    showLoading();

    final result = await _newsRepo.getSearchedNews(searchTextController.text);

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
