import '../../../../core/utils/either.dart';
import '../../../home/data/dtos/create_activity_dto.dart';
import '../../../home/data/dtos/get_user_activities_dto.dart';
import '../../../home/domain/models/activity_model.dart';

abstract interface class IActivitiesRepository {
  AsyncResult<bool> createActivity(CreateActivityDto dto);
  AsyncResult<List<ActivityModel>> getUserActivities(GetUserActivitiesDto dto);
}
