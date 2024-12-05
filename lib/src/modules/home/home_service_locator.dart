import '../../core/contracts/modules/module_service_locator.dart';
import '../../core/services/services.dart';
import 'presenter/controllers/activities_form_controller.dart';
import 'presenter/controllers/home_controller.dart';

class HomeServiceLocator extends ModuleServiceLocator {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindFactory(HomeController.new);
    ServiceLocator.instance.bindFactory(ActivitiesFormController.new);
  }
}
