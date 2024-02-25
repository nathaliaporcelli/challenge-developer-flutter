import '../../../../../../core/services/client/dtos/client_request_dto.dart';
import '../../../../../../core/services/client/i_client_service.dart';
import '../../domain/dtos/student_dto.dart';
import '../../domain/entities/student_entity.dart';
import '../../domain/repositories/i_menu_repository.dart';
import '../adapters/dtos/student_dto_adapter.dart';
import '../adapters/entities/student_entity_adapter.dart';

class MenuRepository implements IMenuRepository {
  final IClientService clientService;

  MenuRepository({required this.clientService});

  @override
  Future<void> deleteStudentById(int id) async {
    await clientService.delete(
      ClientRequestDTO(
        path: 'student/$id',
      ),
    );
  }

  @override
  Future<List<StudentEntity>> getAllStudents() async {
    final response = await clientService.get(
      const ClientRequestDTO(
        path: 'student',
      ),
    );

    final userList = (response.body as List<dynamic>)
        .map((dynamic item) => StudentEntityAdapter.fromMap(item as Map<String, dynamic>))
        .toList();

    return userList;
  }

  @override
  Future<void> postStudent(StudentDTO dto) async {
    await clientService.post(
      ClientRequestDTO(
        path: 'student',
        data: StudentDTOAdapter.toMap(dto),
      ),
    );
  }
}
