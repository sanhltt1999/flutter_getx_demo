import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/feature/news_headline/binding/news_headline_binding.dart';
import 'package:getx/feature/news_headline/view/news_headling_view.dart';
import 'package:getx/feature/search_news/binding/search_news_binding.dart';
import 'package:getx/feature/search_news/view/search_news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      getPages: [
        GetPage(
          name: "/news_headline",
          page: () => const NewHeadLineView(),
          binding: NewsHeadlineBinding(),
        ),
        GetPage(
          name: "/search_news",
          page: () => const SearchNewsView(),
          binding: SearchNewsBinding(),
        ),
      ],
      initialRoute: "/news_headline",
    );
  }
}
