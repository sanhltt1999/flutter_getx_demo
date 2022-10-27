import 'package:dio/dio.dart';
import 'http_services.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "31df0706fb6248faa2ba5f1347cb94a0";

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
    return response;
  }

  initializeInterceptor() {

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print("${options.method} | ${options.path}");
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      print(
          "${response.statusCode} ${response.statusMessage} ${response.data}");
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      print(e.message);
      return handler.next(e); //continue
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {"Authorization": "Bearer $API_KEY"},
    ));
    initializeInterceptor();
  }
}
