import 'package:dio/dio.dart';
import 'package:getx_news_app/service/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "67ebfd225439481a9e9cc9a9cb77c45b";

class HttpServiceImpl implements HttpService {
  Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL, headers: {'Authorization': 'Bearer $API_KEY'}));
    _dio.interceptors.add(InterceptorsWrapper(onError: (error) {
      print(error.message);
    }, onRequest: (request) {
      print('${request.method} ${request.path}');
    }, onResponse: (response) {
      print(
          '${response.statusCode} ${response.statusMessage} ${response.data}');
    }));
  }
}
