import '../../../../core/contracts/contracts.dart';
import '../../../../core/services/services.dart';
import '../../../../core/utils/either.dart';
import '../../data/dtos/auth_user_dto.dart';

class SignUpUserUsecase implements AsyncUsecaseWithParamsContract<bool, AuthUserDto> {
  final IAuthService _authService;

  const SignUpUserUsecase({
    required IAuthService authService,
  }) : _authService = authService;

  @override
  AsyncResult<bool> execute(AuthUserDto dto) async {
    return _authService.signUpWithEmail(dto.email, dto.password);
  }
}
