import '../../../../core/contracts/app_notifier.dart';
import '../../../../core/states/current_user_state.dart';
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
        userId: CurrentUserState.userId,
      ),
    );

    result.fold(
      (error) => setState(ErrorHomeState(error.message)),
      (activities) {
        HomeContentState.setActivities(activities);
        setState(LoadedHomeState());
      },
    );
  }
}
