import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._instance();

  late Dio dio;
  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: "http:127.0.0.1:8000",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf8",
        responseType: ResponseType.json);
    dio = Dio(options);
  }
}
