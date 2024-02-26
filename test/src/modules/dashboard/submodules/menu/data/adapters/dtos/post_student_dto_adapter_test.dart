import 'package:cesla/src/modules/dashboard/submodules/menu/data/adapters/dtos/post_student_dto_adapter.dart';
import 'package:cesla/src/modules/dashboard/submodules/menu/domain/dtos/post_student_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostStudentDTOAdapter ', () {
    test('should be able to parse post student dto in json map successfully', () async {
      // Arrange
      const name = 'Artur';
      const email = 'artur@gmail.com';
      final birthdate = DateTime(2004, 09, 09);
      const academicRecord = '395731';
      const cpf = '78238111030';

      final dto = PostStudentDTO(
        name: name,
        email: email,
        birthDate: birthdate,
        academicRecord: academicRecord,
        cpf: cpf,
      );

      // Act
      final map = PostStudentDTOAdapter.toMap(dto);

      // Assert
      expect(map['name'], name);
      expect(map['email'], email);
      expect(DateTime.parse(map['birthdate']), birthdate);
      expect(map['academic_record'], academicRecord);
      expect(map['cpf'], cpf);
    });
  });
}
