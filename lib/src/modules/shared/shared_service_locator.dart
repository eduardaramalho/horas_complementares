import '../../core/contracts/modules/module_service_locator.dart';
import '../../core/services/services.dart';
import 'data/datasources/activities_datasource.dart';
import 'data/repositories/activities_repository.dart';
import 'domain/repositories/i_activities_repository.dart';

class SharedServiceLocator extends ModuleServiceLocator {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindSingleton<IActivitiesDataSource>(
      ActivitiesDataSource(
        httpService: get(),
      ),
    );
    ServiceLocator.instance.bindSingleton<IActivitiesRepository>(
      ActivitiesRepository(get()),
    );
  }
}
