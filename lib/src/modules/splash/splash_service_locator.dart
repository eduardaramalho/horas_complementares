import '../../core/contracts/modules/module_service_locator.dart';
import '../../core/services/services.dart';
import 'domain/usecases/verify_user_is_logged_usecase.dart';
import 'presenter/controllers/splash_controller.dart';

class SplashServiceLocator extends ModuleServiceLocator {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindSingleton(
      VerifyUserIsLoggedUsecase(
        authService: ServiceLocator.instance.get<IAuthService>(),
      ),
    );

    ServiceLocator.instance.bindFactory(
      () => SplashController(
        ServiceLocator.instance.get<VerifyUserIsLoggedUsecase>(),
      ),
    );
  }
}
