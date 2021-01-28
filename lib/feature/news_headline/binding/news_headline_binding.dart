import 'package:get/get.dart';
import 'package:getx_news_app/core/repository/news_repo_impl.dart';
import 'package:getx_news_app/feature/news_headline/controller/news_headline_controller.dart';
import 'package:getx_news_app/service/http_serviceImpl.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImp());
    Get.put(NewsHeadlineController());
  }
}
