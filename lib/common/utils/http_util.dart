import 'package:dio/dio.dart';
import 'package:simply_shop/common/value/constatnt.dart';
import 'package:simply_shop/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  late Dio dio;
  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        // baseUrl: "http://172.20.10.12/",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
    print('my response data is ${response.data.toString()}');
    print(' response status is ${response.statusCode.toString()}');
    return response.data;
  }
}
