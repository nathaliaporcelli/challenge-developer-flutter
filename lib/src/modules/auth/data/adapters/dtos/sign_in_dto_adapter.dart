import '../../../domain/dtos/sign_in_dto.dart';

class SignInDTOAdapter {
  static Map<String, dynamic> toMap(SignInDTO dto) {
    return {
      'email': dto.username,
      'password': dto.password,
    };
  }
}
