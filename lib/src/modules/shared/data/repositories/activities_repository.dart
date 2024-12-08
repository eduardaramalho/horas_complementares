import '../../../../core/utils/either.dart';
import '../../../home/data/dtos/create_activity_dto.dart';
import '../../../home/data/dtos/get_user_activities_dto.dart';
import '../../../home/domain/models/activity_model.dart';
import '../../domain/repositories/i_activities_repository.dart';
import '../datasources/activities_datasource.dart';

class ActivitiesRepository implements IActivitiesRepository {
  final IActivitiesDataSource _petDataSource;

  const ActivitiesRepository(this._petDataSource);

  @override
  AsyncResult<bool> createActivity(CreateActivityDto dto) async {
    return await _petDataSource.createActivity(dto);
  }

  @override
  AsyncResult<List<ActivityModel>> getUserActivities(GetUserActivitiesDto dto) async {
    return await _petDataSource.getUserActivitiess(dto);
  }
}
