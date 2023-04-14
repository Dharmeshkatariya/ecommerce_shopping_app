import 'package:dio/dio.dart';

import '../custom_interceptors.dart';
import '../utills/constant.dart';

class RestClient {
  late Dio _dio;

  RestClient() {
    var options = BaseOptions(
      baseUrl: Constant.baseURL,
    );
    _dio = Dio(options);
    _dio.interceptors.add(CustomInterceptors());
  }

  Future<Response<dynamic>> get({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    return _dio.get(path, queryParameters: data).then((value) => value);
  }

  Future<Response<dynamic>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio
        .post(path, data: data, queryParameters: queryParameters)
        .then((value) => value);
  }

  Future<Response<dynamic>> update({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio
        .put(path, data: data, queryParameters: queryParameters)
        .then((value) => value);
  }

  Future<Response<dynamic>> delete({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio
        .delete(path, data: data, queryParameters: queryParameters)
        .then((value) => value);
  }
}
