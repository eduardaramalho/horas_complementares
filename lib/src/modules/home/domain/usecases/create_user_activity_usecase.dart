import '../../../../core/contracts/contracts.dart';
import '../../../../core/utils/either.dart';
import '../../../shared/domain/repositories/i_activities_repository.dart';
import '../../data/dtos/create_activity_dto.dart';

class CreateUserActivityUsecase implements AsyncUsecaseWithParamsContract<bool, CreateActivityDto> {
  final IActivitiesRepository _activitiesRepository;

  const CreateUserActivityUsecase({
    required IActivitiesRepository activitiesRepository,
  }) : _activitiesRepository = activitiesRepository;

  @override
  AsyncResult<bool> execute(CreateActivityDto dto) async {
    return await _activitiesRepository.createActivity(dto);
  }
}
