import 'package:cesla/src/modules/auth/data/adapters/entities/user_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserAdapter ', () {
    test('should be able to parse json map in user entity successfully', () async {
      // Arrange
      const id = 1;
      const email = 'artur@gmail.com';
      const token = 'dOIs9L8ghx9br1gxUu';

      final map = {
        'id': id.toString(),
        'email': email,
        'token': token,
      };

      // Act
      final user = UserAdapter.fromMap(map);

      // Assert
      expect(user.id, id);
      expect(user.email, email);
      expect(user.token, token);
    });

    test('should be NOT able to parse json map in user entity', () async {
      // Arrange
      const id = 1;
      const email = 'artur@gmail.com';
      const token = 'dOIs9L8ghx9br1gxUu';

      final map = {
        'id': 'aasa$id',
        'email': email,
        'token': token,
      };

      // Act & Assert
      expect(() => UserAdapter.fromMap(map), throwsA(isA<FormatException>()));
    });
  });
}
