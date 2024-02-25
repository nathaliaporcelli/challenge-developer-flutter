import '../../../domain/dtos/put_student_dto.dart';

class PutStudentDTOAdapter {
  static Map<String, dynamic> toMap(PutStudentDTO dto) {
    final map = {
      'name': dto.name,
      'email': dto.email,
      'birthdate': dto.birthDate == null ? dto.birthDate : dto.birthDate!.toIso8601String(),
      'academic_record': dto.academicRecord,
      'cpf': dto.cpf,
    };
    map.removeWhere((key, value) => value == null);

    return map;
  }
}
