import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/config/constans.dart';

import 'base_auth_data_source.dart';

class RemoteAuthDataSource extends BaseAuthDataSource {
  final Dio _dio;

  RemoteAuthDataSource(this._dio);
  @override
  Future<Response> signIn(
      {required String email, required String password}) async {
    return await _dio.post(
      '/api/v1/auth/signup',
      data: {
        "email": email,
        "passward": password,
      },
    );
  }
}
