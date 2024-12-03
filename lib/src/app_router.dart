import 'package:go_router/go_router.dart';

import 'core/keys/app_global_keys.dart';
import 'core/routes/module_routes.dart';
import 'core/routes/routes.dart';
import 'modules/auth/auth_routes.dart';
import 'modules/home/home_routes.dart';
import 'modules/splash/splash_routes.dart';

class AppRouter {
  static final AppRouter instance = AppRouter._internal();

  factory AppRouter() => instance;

  AppRouter._internal();

  GoRouter get router {
    return GoRouter(
      navigatorKey: AppGlobalKeys.navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: Routes.splash.path,
      routes: _routes,
    );
  }

  List<GoRoute> get _routes {
    return modulesRoutes.expand((module) => module.getRoutes()).toList();
  }

  List<ModuleRoutes> get modulesRoutes {
    return [
      SplashRoutes(),
      AuthRoutes(),
      HomeRoutes(),
    ];
  }
}
