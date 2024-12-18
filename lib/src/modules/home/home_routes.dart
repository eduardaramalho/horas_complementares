import '../../core/routes/base_route.dart';
import '../../core/routes/module_routes.dart';
import '../../core/routes/routes.dart';
import '../../core/services/service_locator/implementations/service_locator.dart';
import 'domain/models/activity_model.dart';
import 'presenter/controllers/activities_form_controller.dart';
import 'presenter/controllers/home_controller.dart';
import 'presenter/pages/actitivies_detail_page.dart';
import 'presenter/pages/activities_form_page.dart';
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
        BaseRoute(
          route: Routes.activitiesForm,
          builder: (_, params) => ActivitiesFormPage(
            controller: ServiceLocator.instance.get<ActivitiesFormController>(),
          ),
        ),
        BaseRoute(
          route: Routes.activityDetails,
          builder: (_, params) {
            return ActivitiesDetailPage(
              activity: params.extra as ActivityModel,
            );
          },
        ),
      ];
}
