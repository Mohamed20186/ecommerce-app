import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/data_source/base_auth_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final BaseAuthDataSource _baseAuthDataSource;

  AuthRepositoryImp(this._baseAuthDataSource);
  @override
  signIn({required String email, required String password}) async {
    try {
      final response =
          _baseAuthDataSource.signIn(email: email, password: password);
    } on DioException catch (dioException) {
      // TODO
    }
  }
}
