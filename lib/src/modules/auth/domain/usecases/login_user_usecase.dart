import '../../../../core/contracts/contracts.dart';
import '../../../../core/services/services.dart';
import '../../../../core/utils/either.dart';
import '../../data/dtos/auth_user_dto.dart';

class LoginUserUsecase implements AsyncUsecaseWithParamsContract<bool, AuthUserDto> {
  final IAuthService _authService;

  const LoginUserUsecase({
    required IAuthService authService,
  }) : _authService = authService;

  @override
  AsyncResult<bool> execute(AuthUserDto dto) {
    return _authService.loginWithEmail(dto.email, dto.password);
  }
}
