import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/web_service.dart';
import 'package:ecommerce_app/features/auth/data/data_source/base_auth_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repository_imp/auth_repository_imp.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());
  static AuthCubit get(context) => BlocProvider.of(context);
  final WebService _webService = WebService();
  late SignInUseCase _signInUseCase;
  late AuthRepository _authRepository;
  late BaseAuthDataSource _baseAuthDataSource;
  Future<void> signIn({required String email, required String password}) async {
    _baseAuthDataSource = RemoteAuthDataSource(_webService.freeDio);
    _authRepository = AuthRepositoryImp(_baseAuthDataSource);
    _signInUseCase = SignInUseCase(_authRepository);

    final result = await _signInUseCase.execute(
      email: email,
      password: password,
    );
  }
}
