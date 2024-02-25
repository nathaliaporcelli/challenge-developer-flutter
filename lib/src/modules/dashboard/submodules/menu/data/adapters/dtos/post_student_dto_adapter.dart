import '../../../domain/dtos/post_student_dto.dart';

class PostStudentDTOAdapter {
  static Map<String, dynamic> toMap(PostStudentDTO dto) {
    return {
      'name': dto.name,
      'email': dto.email,
      'birthdate': dto.birthDate.toIso8601String(),
      'academic_record': dto.academicRecord,
      'cpf': dto.cpf,
    };
  }
}
