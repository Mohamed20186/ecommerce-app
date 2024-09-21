import 'package:dio/src/response.dart';
import 'package:ecommerce_app/features/auth/data/data_source/base_auth_data_source.dart';

class LocalAuthDataSource extends BaseAuthDataSource {
  @override
  Future<Response> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
