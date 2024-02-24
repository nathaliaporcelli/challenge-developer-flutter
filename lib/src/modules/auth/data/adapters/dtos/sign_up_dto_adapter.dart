import '../../../domain/dtos/sign_up_dto.dart';

class SignUpDTOAdapter {
  static Map<String, dynamic> toMap(SignUpDTO dto) {
    return {
      'email': dto.username,
      'password': dto.password,
    };
  }
}
