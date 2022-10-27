import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx/core/widget/drawer.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search News"),
      ),
      drawer: getAppDrawer(),
      body: Container(),
    );
  }
}
