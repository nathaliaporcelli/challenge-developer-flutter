import '../../../../core/exceptions/cesla_exceptions.dart';

class UserNotFoundException extends CeslaException {
  UserNotFoundException({required super.message});
}
