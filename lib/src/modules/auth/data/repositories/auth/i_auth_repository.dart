import '../../../domain/dtos/sign_in_dto.dart';
import '../../../domain/dtos/sign_up_dto.dart';

abstract interface class IAuthRepository {
  Future<void> signInUser(SignInDTO dto);
  Future<void> signUpUser(SignUpDTO dto);
}
