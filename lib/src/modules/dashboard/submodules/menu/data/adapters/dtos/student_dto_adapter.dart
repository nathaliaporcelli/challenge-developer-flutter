import '../../../domain/dtos/student_dto.dart';

class StudentDTOAdapter {
  static Map<String, dynamic> toMap(StudentDTO dto) {
    return {
      'name': dto.name,
      'email': dto.email,
      'birthdate': dto.birthDate.toIso8601String(),
      'academic_record': dto.academicRecord,
      'cpf': dto.cpf,
    };
  }
}
