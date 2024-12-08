import 'core/contracts/modules/module_service_locator.dart';
import 'core/core_service_locator.dart';
import 'modules/auth/auth_service_locator.dart';
import 'modules/home/home_service_locator.dart';
import 'modules/shared/shared_service_locator.dart';
import 'modules/splash/splash_service_locator.dart';

class AppInjections {
  static List<ModuleServiceLocator> modules = [
    CoreServiceLocator(),
    SplashServiceLocator(),
    SharedServiceLocator(),
    AuthServiceLocator(),
    HomeServiceLocator(),
  ];

  static Future<void> initialize() async {
    await Future.forEach(modules, (module) => module.registerBinds());
  }
}
