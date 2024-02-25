import 'core/services/client/dio/dio_client_service.dart';
import 'core/services/client/dio/factories/dio_factory.dart';
import 'core/services/client/i_client_service.dart';
import 'core/services/injector/app_injector.dart';
import 'modules/auth/data/repositories/i_auth_repository.dart';
import 'modules/auth/domain/repositories/auth_repository.dart';
import 'modules/auth/presenter/stores/auth_store.dart';
import 'modules/dashboard/submodules/menu/data/repositories/i_menu_repository.dart';
import 'modules/dashboard/submodules/menu/domain/repositories/menu_repository.dart';

class AppInjections {
  static void registerBinds() {
    AppInjector.registerLazySingleton<IClientService>(
      DioClientService(
        dio: DioFactory.create(),
      ),
    );
    AppInjector.registerLazySingleton<IAuthRepository>(
      AuthRepository(
        clientService: AppInjector.retrive<IClientService>(),
      ),
    );
    AppInjector.registerFactory(
      AuthStore(
        AppInjector.retrive<IAuthRepository>(),
      ),
    );
    AppInjector.registerLazySingleton<IMenuRepository>(
      MenuRepository(
        clientService: AppInjector.retrive<IClientService>(),
      ),
    );
  }
}
