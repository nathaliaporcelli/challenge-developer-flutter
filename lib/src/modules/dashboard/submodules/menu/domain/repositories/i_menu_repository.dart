import '../dtos/post_student_dto.dart';
import '../dtos/put_student_dto.dart';
import '../entities/student_entity.dart';

abstract interface class IMenuRepository {
  Future<List<StudentEntity>> getAllStudents();
  Future<void> postStudent(PostStudentDTO dto);
  Future<void> putStudent(PutStudentDTO dto);
  Future<void> deleteStudentById(int id);
}
