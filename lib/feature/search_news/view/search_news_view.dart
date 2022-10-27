import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx/core/widget/drawer.dart';
import 'package:getx/feature/search_news/controller/search_news_cotroller.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search News"),
      ),
      drawer: getAppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(child: Obx(() {
            return controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.articles.isEmpty
                    ? const Center(
                        child: Text("No news found"),
                      )
                    : Container(
                        margin: const EdgeInsets.all(10),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                      controller.articles[index].imageUrl),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    controller.articles[index].title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    controller.articles[index].desc,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                                  height: 32,
                                ),
                            itemCount: controller.articles.length),
                      );
          }))
        ],
      ),
    );
  }
}
