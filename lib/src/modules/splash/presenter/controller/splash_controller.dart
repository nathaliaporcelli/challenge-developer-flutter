import '../../../auth/domain/repositories/i_auth_repository.dart';

class SplashController {
  final IAuthRepository _authRepository;

  SplashController(this._authRepository);

  Future<bool> isAuthenticated() async {
    final isAuthenticated = await _authRepository.isAuthenticated();

    return isAuthenticated;
  }
}
