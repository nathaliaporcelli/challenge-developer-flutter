import '../../../../core/services/client/dtos/client_request_dto.dart';
import '../../../../core/services/client/exceptions/client_exception.dart';
import '../../../../core/services/client/i_client_service.dart';
import '../../../../core/services/storage/i_storage_service.dart';
import '../../domain/dtos/sign_in_dto.dart';
import '../../domain/dtos/sign_up_dto.dart';
import '../../domain/exceptions/user_not_found_exception.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../adapters/dtos/sign_in_dto_adapter.dart';
import '../adapters/dtos/sign_up_dto_adapter.dart';
import '../adapters/entities/user_adapter.dart';

class AuthRepository implements IAuthRepository {
  final IClientService clientService;
  final IStorageService storageService;

  const AuthRepository({
    required this.clientService,
    required this.storageService,
  });

  @override
  Future<void> signUpUser(SignUpDTO dto) async {
    final data = SignUpDTOAdapter.toMap(dto);

    final response = await clientService.post(
      ClientRequestDTO(
        path: 'login/',
        data: data,
      ),
    );

    final user = UserAdapter.fromMap(response.body);
    await storageService.put('userId', user.id);
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

    final userMap = usersList.firstWhere(
      (user) => user['email'] == dto.username && user['password'] == dto.password,
      orElse: () => throw const UserNotFoundException(),
    );

    final user = UserAdapter.fromMap(userMap);
    await storageService.put('userId', user.id);
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      final userId = await storageService.get('userId');

      if (userId == null) return false;

      final response = await clientService.get(
        ClientRequestDTO(
          path: 'login/$userId',
        ),
      );

      if (response.statusCode == 200) return true;

      return false;
    } on ClientException catch (e) {
      if (e.statusCode == 404) {
        await storageService.remove('userId');
      }
      return false;
    }
  }
}
