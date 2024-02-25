class StudentEntity {
  final int id;
  final String name;
  final DateTime? birthDate;
  final String cpf;
  final String academicRecord;
  final String email;

  const StudentEntity({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.cpf,
    required this.academicRecord,
    required this.email,
  });
}
