import 'package:getx_news_app/core/model/article.dart';

abstract class NewsRepo {
  Future<List<Article>> getNewHeadLine();
  Future<List<Article>> getSearchNews(String query);
}