import '../../../../core/contracts/app_notifier.dart';
import '../../../../core/states/current_user_state.dart';
import '../../data/dtos/create_activity_dto.dart';
import '../../domain/enums/activity_status_enum.dart';
import '../../domain/usecases/create_user_activity_usecase.dart';
import 'states/activities_form_content_state.dart';
import 'states/activities_form_state.dart';

class ActivitiesFormController extends AppNotifier<ActivitiesFormState> {
  final CreateUserActivityUsecase _createUserActivityUsecase;

  ActivitiesFormController(this._createUserActivityUsecase) : super(const InitialActivitiesFormState());

  void init() {
    ActivitiesFormContentState.reset();
    setState(const InitialActivitiesFormState());
  }

  Future<void> createActivity() async {
    setState(const SendingActivitiesFormState());

    final dto = CreateActivityDto(
      userId: CurrentUserState.userId,
      title: ActivitiesFormContentState.name,
      description: ActivitiesFormContentState.description,
      category: ActivitiesFormContentState.category!,
      workload: ActivitiesFormContentState.workload.value,
      // Não devera ser passado o status aqui, pois o status é definido pelo backend
      status: ActivityStatusEnum.pending,
    );

    final result = await _createUserActivityUsecase.execute(dto);

    result.fold(
      (error) => setState(ErrorActivitiesFormState(error.message)),
      (success) => SuccessActivitiesFormState(),
    );
  }
}
