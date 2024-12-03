import 'package:go_router/go_router.dart';

import '../../core/routes/base_route.dart';
import '../../core/routes/module_routes.dart';
import '../../core/routes/routes.dart';
import '../../core/services/service_locator/implementations/service_locator.dart';
import 'presenter/controllers/auth_controller.dart';
import 'presenter/pages/auth_page.dart';

class AuthRoutes extends ModuleRoutes {
  @override
  List<BaseRoute> get routes => [
        BaseRoute(
          route: Routes.auth,
          pageBuilder: (_, params) => NoTransitionPage(
            child: AuthPage(
              controller: ServiceLocator.instance.get<AuthController>(),
            ),
          ),
        ),
      ];
}
