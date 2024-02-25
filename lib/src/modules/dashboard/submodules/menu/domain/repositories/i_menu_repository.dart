import '../dtos/student_dto.dart';
import '../entities/student_entity.dart';

abstract interface class IMenuRepository {
  Future<List<StudentEntity>> getAllStudents();
  Future<void> postStudent(StudentDTO dto);
  Future<void> putStudent(int id, StudentDTO dto);
  Future<void> deleteStudentById(int id);
}
