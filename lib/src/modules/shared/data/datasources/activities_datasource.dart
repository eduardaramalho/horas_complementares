import '../../../../core/services/services.dart';
import '../../../../core/utils/either.dart';
import '../../../home/data/dtos/create_activity_dto.dart';
import '../../../home/data/dtos/get_user_activities_dto.dart';
import '../../../home/domain/models/activity_model.dart';
import '../../exceptions/activities_exceptions.dart';

abstract interface class IActivitiesDataSource {
  AsyncResult<bool> createActivity(CreateActivityDto dto);
  AsyncResult<List<ActivityModel>> getUserActivitiess(GetUserActivitiesDto dto);
}

class ActivitiesDataSource implements IActivitiesDataSource {
  final IHttpService _httpService;

  const ActivitiesDataSource({
    required IHttpService httpService,
  }) : _httpService = httpService;

  // @override
  // AsyncResult<bool> addActivities(SaveActivitiesDto dto) async {
  //   try {
  //     final docRef = _firebaseFirestore.collection('Activitiess').doc();

  //     await docRef.set(dto.toMap());

  //     return right(true);
  //   } catch (e, st) {
  //     return left(
  //       SaveActivitiesException(
  //         message: 'Erro ao salvar o Activities',
  //         stackTrace: st,
  //       ),
  //     );
  //   }
  // }

  // @override
  // AsyncResult<List<ActivitiesModel>> getAllActivitiess() async {
  //   try {
  //     final querySnapshot = await _firebaseFirestore.collection('Activitiess').get();

  //     final Activitiess = querySnapshot.docs.map((doc) {
  //       final data = doc.data();
  //       return ActivitiesModel.fromMap({
  //         ...data,
  //         'id': doc.id,
  //       });
  //     }).toList();

  //     return right(Activitiess);
  //   } catch (e, st) {
  //     return left(
  //       GetAllActivitiessException(
  //         message: 'Erro ao buscar os Activitiess',
  //         stackTrace: st,
  //       ),
  //     );
  //   }
  // }

  @override
  AsyncResult<bool> createActivity(CreateActivityDto dto) {
    // TODO: implement createActivity
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<ActivityModel>> getUserActivitiess(GetUserActivitiesDto dto) async {
    try {
      final httpResult = await _httpService.get(
        HttpRequestDTO(
          path: '/activities?userId=${dto.userId}',
        ),
      );

      // parse the response
      final List<ActivityModel> activities =
          (httpResult.body as List).map((e) => ActivityModel.fromMap(e as Map<String, dynamic>)).toList();

      return right(activities);
    } catch (e, st) {
      return left(
        GetUserAcitivitiesException(
          message: 'Erro ao buscar os Activities',
          stackTrace: st,
        ),
      );
    }
  }
}
