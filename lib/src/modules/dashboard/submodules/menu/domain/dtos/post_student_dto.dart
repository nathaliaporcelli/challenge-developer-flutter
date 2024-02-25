class PostStudentDTO {
  final String name;
  final String email;
  final DateTime birthDate;
  final String academicRecord;
  final String cpf;

  const PostStudentDTO({
    required this.name,
    required this.email,
    required this.birthDate,
    required this.academicRecord,
    required this.cpf,
  });
}
