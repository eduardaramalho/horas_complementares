import '../../core/contracts/modules/module_service_locator.dart';
import '../../core/services/services.dart';
import 'domain/usecases/create_user_activity_usecase.dart';
import 'domain/usecases/get_user_activities_usecase.dart';
import 'presenter/controllers/activities_form_controller.dart';
import 'presenter/controllers/home_controller.dart';

class HomeServiceLocator extends ModuleServiceLocator {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindFactory(() => HomeController(get(), get()));
    ServiceLocator.instance.bindFactory(() => ActivitiesFormController(get()));

    ServiceLocator.instance.bindSingleton<GetUserActivitiesUsecase>(
      GetUserActivitiesUsecase(
        activitiesRepository: get(),
      ),
    );

    ServiceLocator.instance.bindSingleton<CreateUserActivityUsecase>(
      CreateUserActivityUsecase(
        activitiesRepository: get(),
      ),
    );
  }
}
