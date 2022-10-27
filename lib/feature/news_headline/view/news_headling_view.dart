import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx/core/widget/drawer.dart';

class NewHeadLineView extends StatelessWidget {
  const NewHeadLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News Headline"),
        ),
        drawer: getAppDrawer(),
        body: Obx(),);
  }
}
