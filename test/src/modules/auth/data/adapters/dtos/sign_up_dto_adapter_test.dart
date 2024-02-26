import 'package:cesla/src/modules/auth/data/adapters/dtos/sign_up_dto_adapter.dart';
import 'package:cesla/src/modules/auth/domain/dtos/sign_up_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpDtoAdapter', () {
    test('should be able to parse sign up dto in json map successfully', () async {
      // Arrange
      const username = 'artur';
      const password = '123';

      const signUpDTO = SignUpDTO(
        username: username,
        password: password,
      );

      // Act
      final map = SignUpDTOAdapter.toMap(signUpDTO);

      // Assert
      expect(map['email'], username);
      expect(map['password'], password);
    });
  });
}
