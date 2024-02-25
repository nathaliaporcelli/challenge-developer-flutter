import '../../../domain/entities/student_entity.dart';

class StudentEntityAdapter {
  static StudentEntity fromMap(Map<String, dynamic> map) {
    return StudentEntity(
      id: int.parse(map['id']),
      name: map['name'],
      birthDate: map['birthDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['birthDate']) : null,
      cpf: map['cpf'].toString(),
      academicRecord: map['academicRecord'].toString(),
      email: map['email'],
    );
  }
}
