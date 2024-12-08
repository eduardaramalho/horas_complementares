import '../../../../core/contracts/contracts.dart';
import '../../../../core/utils/either.dart';
import '../../../shared/domain/repositories/i_activities_repository.dart';
import '../../data/dtos/get_user_activities_dto.dart';
import '../models/activity_model.dart';

class GetUserActivitiesUsecase implements AsyncUsecaseWithParamsContract<List<ActivityModel>, GetUserActivitiesDto> {
  final IActivitiesRepository _activitiesRepository;

  const GetUserActivitiesUsecase({
    required IActivitiesRepository activitiesRepository,
  }) : _activitiesRepository = activitiesRepository;

  @override
  AsyncResult<List<ActivityModel>> execute(GetUserActivitiesDto dto) async {
    return await _activitiesRepository.getUserActivities(dto);
  }
}
