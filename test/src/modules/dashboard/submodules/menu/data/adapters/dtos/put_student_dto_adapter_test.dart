import 'package:cesla/src/modules/dashboard/submodules/menu/data/adapters/dtos/put_student_dto_adapter.dart';
import 'package:cesla/src/modules/dashboard/submodules/menu/domain/dtos/put_student_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PutStudentDTOAdapter ', () {
    test('should be able to parse put student dto in json map successfully', () async {
      // Arrange
      const name = 'Artur';
      const email = 'artur@gmail.com';
      const academicRecord = '395731';
      const cpf = '78238111030';

      const dto = PutStudentDTO(
        id: 1,
        name: name,
        email: email,
        academicRecord: academicRecord,
        cpf: cpf,
      );

      // Act
      final map = PutStudentDTOAdapter.toMap(dto);

      // Assert
      expect(map['name'], name);
      expect(map['email'], email);
      expect(map['academic_record'], academicRecord);
      expect(map['cpf'], cpf);
      expect(map['birthdate'], isNull);
    });
  });
}
