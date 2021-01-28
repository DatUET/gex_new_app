import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/model/article.dart';
import 'package:getx_news_app/core/repository/news_repo.dart';
import 'package:getx_news_app/core/repository/news_repo_impl.dart';

class SearchNewsController extends GetxController {
  NewsRepo _newsRepo;
  RxList<Article> articles = RxList();
  RxBool isLoading = false.obs;
  final searchTextController = TextEditingController();

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImp>();
    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNews();
      }
    });
  }

  searchNews() async {
    showLoading();
    final result = await _newsRepo.getSearchNews(searchTextController.text);
    hideLoading();
    if (result != null) {
      articles = result.obs;
    } else {
      print('No data result');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
