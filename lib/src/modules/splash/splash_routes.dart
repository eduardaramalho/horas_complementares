import '../../core/routes/base_route.dart';
import '../../core/routes/module_routes.dart';
import '../../core/routes/routes.dart';
import '../../core/services/service_locator/implementations/service_locator.dart';
import 'presenter/controllers/splash_controller.dart';
import 'presenter/pages/splash_page.dart';

class SplashRoutes extends ModuleRoutes {
  @override
  List<BaseRoute> get routes => [
        BaseRoute(
          route: Routes.splash,
          builder: (_, params) => SplashPage(
            controller: ServiceLocator.instance.get<SplashController>(),
          ),
        ),
      ];
}
