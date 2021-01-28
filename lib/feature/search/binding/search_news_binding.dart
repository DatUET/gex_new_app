import 'package:get/get.dart';
import 'package:getx_news_app/feature/search/controller/search_news_controller.dart';
import 'package:getx_news_app/service/http_serviceImpl.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
