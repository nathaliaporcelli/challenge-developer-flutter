import 'package:cesla/src/modules/dashboard/submodules/menu/data/adapters/entities/student_entity_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserAdapter ', () {
    test('should be able to parse json map in user entity successfully', () async {
      // Arrange
      const id = 1;
      const name = 'Artur';
      const email = 'artur@gmail.com';
      const academicRecord = '395731';
      const cpf = '78238111030';

      final map = {
        'id': id.toString(),
        'name': name,
        'email': email,
        'academic_record': academicRecord,
        'cpf': cpf,
      };

      // Act
      final student = StudentEntityAdapter.fromMap(map);

      // Assert
      expect(map['name'], student.name);
      expect(map['email'], student.email);
      expect(map['academic_record'], student.academicRecord);
      expect(map['cpf'], student.cpf);
      expect(map['birthdate'], student.birthDate);
    });
  });
}
