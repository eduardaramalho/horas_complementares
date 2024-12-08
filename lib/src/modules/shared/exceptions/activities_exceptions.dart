import '../../../core/errors/app_error.dart';

class CreateActivityException extends AppException {
  const CreateActivityException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'create_activity');
}

class GetUserAcitivitiesException extends AppException {
  const GetUserAcitivitiesException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'get_user_activities');
}
