import 'package:get/get.dart';
import 'package:getx_news_app/core/model/article.dart';
import 'package:getx_news_app/core/model/news_response_model.dart';
import 'package:getx_news_app/core/repository/news_repo.dart';
import 'package:getx_news_app/service/http_service.dart';
import 'package:getx_news_app/service/http_serviceImpl.dart';

class NewsRepoImp implements NewsRepo {
  HttpService _httpService;

  NewsRepoImp() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewHeadLine() async {
    try {
      final response =
          await _httpService.getRequest('v2/top-headlines?country=us');
      final parsedResponse = NewsResponseModel.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>> getSearchNews(String query) async {
    try {
      final response = await _httpService.getRequest('v2/everything?q=$query');
      final parsedResponse = NewsResponseModel.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
