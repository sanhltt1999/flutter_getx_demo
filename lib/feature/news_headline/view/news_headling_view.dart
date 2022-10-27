import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/widget/drawer.dart';
import 'package:getx/feature/news_headline/controller/news_headline_controller.dart';

class NewHeadLineView extends StatelessWidget {
  NewHeadLineView({super.key});

  final controller = Get.find<NewsHeadlineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News Headline"),
        ),
        drawer: getAppDrawer(),
        body: Obx(
          () {
            return controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
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
          },
        ));
  }
}
