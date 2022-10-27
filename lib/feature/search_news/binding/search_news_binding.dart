import 'package:get/get.dart';
import 'package:getx/core/repository/news_repo_impl.dart';
import 'package:getx/feature/search_news/controller/search_news_cotroller.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
