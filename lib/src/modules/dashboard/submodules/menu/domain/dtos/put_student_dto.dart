class PutStudentDTO {
  final int id;
  final String? name;
  final String? email;
  final DateTime? birthDate;
  final String? academicRecord;
  final String? cpf;

  const PutStudentDTO({
    required this.id,
    this.name,
    this.email,
    this.birthDate,
    this.academicRecord,
    this.cpf,
  });
}
