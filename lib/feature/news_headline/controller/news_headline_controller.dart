import 'package:get/get.dart';
import 'package:getx_news_app/core/model/article.dart';
import 'package:getx_news_app/core/repository/news_repo.dart';
import 'package:getx_news_app/core/repository/news_repo_impl.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImp>();
    loadNewsLine();
  }

  RxList<Article> articles;
  RxBool isLoading = false.obs;

  loadNewsLine() async {
    showLoading();
    final result = await _newsRepo.getNewHeadLine();
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