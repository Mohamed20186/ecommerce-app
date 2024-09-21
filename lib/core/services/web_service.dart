import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/config/constans.dart';
import 'package:flutter/material.dart';

class WebService {
  static WebService? _this;

  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  Dio freeDio = Dio();
  Dio tokenDio = Dio();

  String lang = 'en';
  String? myToken;
  final String storageKeyMobileToken = 'Authorization';

  WebService._() {
    freeDio.options.connectTimeout = const Duration(milliseconds: 300);
    freeDio.options.baseUrl = Constans.domain;

    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint(
              'send request : BaseURL:${options.baseUrl} path:${options.path}');
          debugPrint('headers:${options.headers}');
          debugPrint('query parameters:${options.queryParameters}');
          debugPrint('data:${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('statusCode: ${response.statusCode}');
          debugPrint('data: ${response.data}');
          log(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint('error: ${e.error}');
          debugPrint('message: ${e.message}');
          debugPrint('type: ${e.type}');
        },
      ),
    );

    tokenDio.options.connectTimeout = const Duration(milliseconds: 300);
    tokenDio.options.baseUrl = Constans.domain;
  }
}
