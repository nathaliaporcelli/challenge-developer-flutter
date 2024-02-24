import 'core/services/client/dio/dio_client_service.dart';
import 'core/services/client/dio/factories/dio_factory.dart';
import 'core/services/client/i_client_service.dart';
import 'core/services/injector/app_injector.dart';
import 'modules/auth/domain/repositories/auth_repository.dart';
import 'modules/auth/presenter/stores/auth_store.dart';

class AppInjections {
  static void registerBinds() {
    AppInjector.registerLazySingleton<IClientService>(
      DioClientService(
        dio: DioFactory.create(),
      ),
    );
    AppInjector.registerLazySingleton(
      AuthRepository(
        clientService: AppInjector.retrive<IClientService>(),
      ),
    );
    AppInjector.registerFactory(
      AuthStore(
        AppInjector.retrive<AuthRepository>(),
      ),
    );
  }
}
