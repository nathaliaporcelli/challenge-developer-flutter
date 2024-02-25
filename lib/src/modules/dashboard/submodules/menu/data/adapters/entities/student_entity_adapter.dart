import '../../../domain/entities/student_entity.dart';

class StudentEntityAdapter {
  static StudentEntity fromMap(Map<String, dynamic> map) {
    return StudentEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int),
      cpf: map['cpf'] as String,
      academicRecord: map['academicRecord'] as String,
      email: map['email'] as String,
    );
  }
}
