import 'core/services/client/dio/dio_client_service.dart';
import 'core/services/client/dio/factories/dio_factory.dart';
import 'core/services/client/i_client_service.dart';
import 'core/services/injector/injector.dart';
import 'core/services/storage/i_storage_service.dart';
import 'core/services/storage/shared/shared_preference_storage_service.dart';
import 'modules/auth/data/repositories/auth_repository.dart';
import 'modules/auth/domain/repositories/i_auth_repository.dart';
import 'modules/auth/presenter/stores/auth_store.dart';
import 'modules/dashboard/submodules/menu/data/repositories/menu_repository.dart';
import 'modules/dashboard/submodules/menu/domain/repositories/i_menu_repository.dart';
import 'modules/dashboard/submodules/menu/presenter/stores/menu_store.dart';
import 'modules/splash/presenter/controller/splash_controller.dart';

class AppInjections {
  static void registerBinds() {
    Injector.registerLazySingleton<IClientService>(
      DioClientService(
        dio: DioFactory.create(),
      ),
    );
    Injector.registerLazySingleton<IStorageService>(
      SharedPreferencesStorageService(),
    );
    Injector.registerLazySingleton<IAuthRepository>(
      AuthRepository(
        clientService: Injector.retrive<IClientService>(),
        storageService: Injector.retrive<IStorageService>(),
      ),
    );
    Injector.registerFactory<AuthStore>(
      AuthStore(
        Injector.retrive<IAuthRepository>(),
      ),
    );

    Injector.registerLazySingleton<IMenuRepository>(
      MenuRepository(
        clientService: Injector.retrive<IClientService>(),
      ),
    );
    Injector.registerFactory<MenuStore>(
      MenuStore(
        menuRepository: Injector.retrive<IMenuRepository>(),
      ),
    );
    Injector.registerFactory<SplashController>(
      SplashController(
        Injector.retrive<IAuthRepository>(),
      ),
    );
  }
}
