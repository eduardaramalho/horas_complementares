import '../../../../core/contracts/app_notifier.dart';
import '../../data/dtos/get_user_activities_dto.dart';
import '../../domain/usecases/get_user_activities_usecase.dart';
import 'states/home_content_state.dart';
import 'states/home_state.dart';

class HomeController extends AppNotifier<HomeState> {
  final GetUserActivitiesUsecase _getUserActivitiesUsecase;

  HomeController(this._getUserActivitiesUsecase) : super(const InitialHomeState());

  Future<void> getAllActivities() async {
    setState(const LoadingHomeState());

    final result = await _getUserActivitiesUsecase.execute(
      GetUserActivitiesDto(
        userId: '3HR9fewURLUuimQMuCxiJrVcGiQ2',
      ),
    );

    result.fold(
      (error) => setState(ErrorHomeState(error.message)),
      (activities) {
        HomeContentState.setActivities(activities);
        setState(LoadedHomeState());
      },
    );

    // HomeContentState.setActivities([
    //   ActivityModel(
    //     userId: 'userId0',
    //     id: 'id0',
    //     title: 'Artigo - GCS',
    //     description: 'Artigo sobre Gerenciamento de Configuração de Software',
    //     workload: 60,
    //     status: ActivityStatusEnum.aproved,
    //     category: ActivityCategoriesEnum.category0,
    //   ),
    //   ActivityModel(
    //     userId: 'userId1',
    //     id: 'id1',
    //     title: 'Curso Java',
    //     description: 'Curso de Java para iniciantes',
    //     workload: 30,
    //     status: ActivityStatusEnum.pending,
    //     category: ActivityCategoriesEnum.category1,
    //   ),
    //   ActivityModel(
    //     userId: 'userId2',
    //     id: 'id2',
    //     title: 'Projeto Social',
    //     description: 'Projeto de arrecadação de alimentos',
    //     workload: 40,
    //     status: ActivityStatusEnum.reproved,
    //     category: ActivityCategoriesEnum.category2,
    //   ),
    // ]);
  }
}
