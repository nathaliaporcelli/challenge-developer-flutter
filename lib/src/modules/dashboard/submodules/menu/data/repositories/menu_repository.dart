import '../../../../../../core/services/client/dtos/client_request_dto.dart';
import '../../../../../../core/services/client/i_client_service.dart';
import '../../domain/dtos/post_student_dto.dart';
import '../../domain/dtos/put_student_dto.dart';
import '../../domain/entities/student_entity.dart';
import '../../domain/repositories/i_menu_repository.dart';
import '../adapters/dtos/post_student_dto_adapter.dart';
import '../adapters/dtos/put_student_dto_adapter.dart';
import '../adapters/entities/student_entity_adapter.dart';

class MenuRepository implements IMenuRepository {
  final IClientService clientService;

  const MenuRepository({required this.clientService});

  @override
  Future<void> deleteStudentById(int id) async {
    final dto = ClientRequestDTO(
      path: 'student/$id',
    );

    await clientService.delete(dto);
  }

  @override
  Future<List<StudentEntity>> getAllStudents() async {
    const dto = ClientRequestDTO(
      path: 'student',
    );

    final response = await clientService.get(dto);

    final mapList = List<Map<String, dynamic>>.from(response.body);
    return mapList.map(StudentEntityAdapter.fromMap).toList();
  }

  @override
  Future<void> putStudent(PutStudentDTO studentDto) async {
    final data = PutStudentDTOAdapter.toMap(studentDto);

    final dto = ClientRequestDTO(
      path: 'student/${studentDto.id}',
      data: data,
    );

    await clientService.put(dto);
  }

  @override
  Future<void> postStudent(PostStudentDTO dto) async {
    final studentDto = PostStudentDTOAdapter.toMap(dto);

    final requestDto = ClientRequestDTO(
      path: 'student',
      data: studentDto,
    );

    await clientService.post(requestDto);
  }
}
