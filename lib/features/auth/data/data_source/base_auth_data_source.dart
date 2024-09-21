import 'package:dio/dio.dart';

abstract class BaseAuthDataSource {
  Future<Response> signIn({required String email, required String password});
}
