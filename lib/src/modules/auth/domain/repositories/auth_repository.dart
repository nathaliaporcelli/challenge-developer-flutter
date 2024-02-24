import '../../../../core/services/client/dtos/client_request_dto.dart';
import '../../../../core/services/client/i_client_service.dart';
import '../../data/adapters/dtos/sign_in_dto_adapter.dart';
import '../../data/adapters/dtos/sign_up_dto_adapter.dart';
import '../../data/repositories/auth/i_auth_repository.dart';
import '../dtos/sign_in_dto.dart';
import '../dtos/sign_up_dto.dart';

class AuthRepository implements IAuthRepository {
  final IClientService clientService;

  const AuthRepository({required this.clientService});

  @override
  Future<void> signUpUser(SignUpDTO dto) async {
    final response = await clientService.post(
      ClientRequestDTO(
        path: 'login/',
        data: SignUpDTOAdapter.toMap(dto),
      ),
    );

    return;
  }

  @override
  Future<void> signInUser(SignInDTO dto) async {
    final response = await clientService.get(
      ClientRequestDTO(
        path: 'login/',
        data: SignInDTOAdapter.toMap(dto),
      ),
    );

    return;
  }
}
