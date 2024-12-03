import '../../../errors/app_error.dart';

class GetCurrentUserAuthException extends AppException {
  const GetCurrentUserAuthException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'get_current_user_auth');
}

class SignOutAuthException extends AppException {
  const SignOutAuthException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'sign_out_auth');
}

class SignUpAuthException extends AppException {
  const SignUpAuthException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'sign_up_auth');
}

class LogInAuthException extends AppException {
  const LogInAuthException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'sign_up_auth');
}
