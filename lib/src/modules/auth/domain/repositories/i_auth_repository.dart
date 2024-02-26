import '../dtos/sign_in_dto.dart';
import '../dtos/sign_up_dto.dart';

abstract interface class IAuthRepository {
  Future<void> signInUser(SignInDTO dto);
  Future<void> signUpUser(SignUpDTO dto);
  Future<bool> isAuthenticated();
}
