import '../../../domain/entities/student_entity.dart';

class StudentEntityAdapter {
  static StudentEntity fromMap(Map<String, dynamic> map) {
    return StudentEntity(
      id: int.parse(map['id']),
      name: map['name'],
      birthDate: map['birthdate'] != null ? DateTime.parse(map['birthdate']) : null,
      cpf: map['cpf'].toString(),
      academicRecord: map['academic_record'].toString(),
      email: map['email'],
    );
  }
}
