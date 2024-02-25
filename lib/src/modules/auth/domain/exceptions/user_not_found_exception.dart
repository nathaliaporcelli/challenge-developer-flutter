import '../../../../core/exceptions/cesla_exceptions.dart';

class UserNotFoundException extends CeslaException {
  const UserNotFoundException({
    super.message = 'Usuário ou senha inválidos',
  });
}
