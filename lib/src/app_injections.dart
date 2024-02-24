import 'core/services/client/dio/dio_client_service.dart';
import 'core/services/client/dio/factories/dio_factory.dart';
import 'core/services/injector/app_injector.dart';

class AppInjections {
  static void registerBinds() {
    AppInjector.registerLazySingleton(
      DioClientService(dio: DioFactory.create()),
    );
  }
}
