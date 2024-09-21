import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  execute({
    required String email,
    required String password,
  }) async {
    return await _authRepository.signIn(email: email, password: password);
  }
}
