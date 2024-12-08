import '../../core/contracts/modules/module_service_locator.dart';
import '../../core/services/services.dart';
import 'domain/usecases/login_user_usecase.dart';
import 'presenter/controllers/auth_controller.dart';

class AuthServiceLocator extends ModuleServiceLocator {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindSingleton(
      LoginUserUsecase(
        authService: ServiceLocator.instance.get<IAuthService>(),
      ),
    );

    ServiceLocator.instance.bindFactory(
      () => AuthController(
        ServiceLocator.instance.get<LoginUserUsecase>(),
      ),
    );
  }
}
