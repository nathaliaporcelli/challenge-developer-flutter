import '../../../exceptions/cesla_exceptions.dart';

class ClientException extends CeslaException {
  final int statusCode;

  ClientException({
    required super.message,
    required super.stackTrace,
    required this.statusCode,
  });
}
