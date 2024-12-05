import '../../../../core/contracts/app_notifier.dart';
import '../../domain/enums/activity_categories_enum.dart';
import '../../domain/enums/activity_status_enum.dart';
import '../../domain/models/activity_model.dart';
import 'states/home_content_state.dart';
import 'states/home_state.dart';

class HomeController extends AppNotifier<HomeState> {
  HomeController() : super(const InitialHomeState());

  Future<void> getAllActivities() async {
    setState(const LoadingHomeState());

    HomeContentState.setActivities([
      ActivityModel(
        id: 'id0',
        title: 'Artigo - GCS',
        description: 'Artigo sobre Gerenciamento de Configuração de Software',
        workload: 60,
        status: ActivityStatusEnum.aproved,
        category: ActivityCategoriesEnum.category0,
      ),
      ActivityModel(
        id: 'id1',
        title: 'Curso Java',
        description: 'Curso de Java para iniciantes',
        workload: 30,
        status: ActivityStatusEnum.pending,
        category: ActivityCategoriesEnum.category1,
      ),
      ActivityModel(
        id: 'id2',
        title: 'Projeto Social',
        description: 'Projeto de arrecadação de alimentos',
        workload: 40,
        status: ActivityStatusEnum.reproved,
        category: ActivityCategoriesEnum.category2,
      ),
    ]);
  }
}
