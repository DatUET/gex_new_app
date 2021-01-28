import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/feature/news_headline/binding/news_headline_binding.dart';
import 'package:getx_news_app/feature/news_headline/view/news_headline_view.dart';
import 'package:getx_news_app/feature/search/binding/search_news_binding.dart';
import 'package:getx_news_app/feature/search/view/search_new_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/news_headline', page: () => NewHeadlineView(), binding: NewsHeadlineBinding()),
        GetPage(name: '/search_news', page: () => SearchNewsView(), binding: SearchNewsBinding()),
      ],
      initialRoute: '/news_headline',
    );
  }
}

