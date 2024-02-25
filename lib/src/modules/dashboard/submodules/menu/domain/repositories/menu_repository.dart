import '../../../../../../core/services/client/dtos/client_request_dto.dart';
import '../../../../../../core/services/client/i_client_service.dart';
import '../../data/adapters/dtos/student_dto_adapter.dart';
import '../../data/adapters/entities/student_entity_adapter.dart';
import '../../data/repositories/i_menu_repository.dart';
import '../dtos/student_dto.dart';
import '../entities/student_entity.dart';

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

    final List<StudentEntity> userList = response.body
        .map(
          (dynamic item) => StudentEntityAdapter.fromMap(
            item as Map<String, dynamic>,
          ),
        )
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
