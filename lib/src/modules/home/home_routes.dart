import '../../core/routes/base_route.dart';
import '../../core/routes/module_routes.dart';
import '../../core/routes/routes.dart';
import '../../core/services/service_locator/implementations/service_locator.dart';
import 'presenter/controllers/home_controller.dart';
import 'presenter/pages/home_page.dart';

class HomeRoutes extends ModuleRoutes {
  @override
  List<BaseRoute> get routes => [
        BaseRoute(
          route: Routes.home,
          builder: (_, params) => HomePage(
            controller: ServiceLocator.instance.get<HomeController>(),
          ),
        ),
      ];
}
