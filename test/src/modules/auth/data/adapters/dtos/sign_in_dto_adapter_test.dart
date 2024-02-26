import 'package:cesla/src/modules/auth/data/adapters/dtos/sign_in_dto_adapter.dart';
import 'package:cesla/src/modules/auth/domain/dtos/sign_in_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignInDtoAdapter', () {
    test('should be able to parse sign in dto in json map successfully', () async {
      // Arrange
      const username = 'artur';
      const password = '123';

      const signInDTO = SignInDTO(
        username: username,
        password: password,
      );

      // Act
      final map = SignInDTOAdapter.toMap(signInDTO);

      // Assert
      expect(map['email'], username);
      expect(map['password'], password);
    });
  });
}
