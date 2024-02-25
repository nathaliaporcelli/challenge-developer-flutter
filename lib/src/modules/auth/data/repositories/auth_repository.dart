import '../../../../core/services/client/dtos/client_request_dto.dart';
import '../../../../core/services/client/i_client_service.dart';
import '../../domain/dtos/sign_in_dto.dart';
import '../../domain/dtos/sign_up_dto.dart';
import '../../domain/exceptions/user_not_found_exception.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../adapters/dtos/sign_in_dto_adapter.dart';
import '../adapters/dtos/sign_up_dto_adapter.dart';

class AuthRepository implements IAuthRepository {
  final IClientService clientService;

  const AuthRepository({required this.clientService});

  @override
  Future<void> signUpUser(SignUpDTO dto) async {
    final data = SignUpDTOAdapter.toMap(dto);

    final response = await clientService.post(
      ClientRequestDTO(
        path: 'login/',
        data: data,
      ),
    );

    return;
  }

  @override
  Future<void> signInUser(SignInDTO dto) async {
    final data = SignInDTOAdapter.toMap(dto);

    final response = await clientService.get(
      ClientRequestDTO(
        path: 'login/',
        data: data,
      ),
    );

    final usersList = List<Map<String, dynamic>>.from(response.body);
    final userExists = usersList.any((user) => user['username'] == dto.username && user['password'] == dto.password);

    if (!userExists) throw const UserNotFoundException();
  }
}
