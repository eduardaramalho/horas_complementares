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
  AsyncResult<bool> execute(AuthUserDto dto) async {
    final result = await _authService.loginWithEmail(dto.email, dto.password);

    // TODO: apenas para demonstração
    // quando tiver o sistema de login da Católica
    // que não permite auto cadastro, apenas login
    if (result.isError) {
      final signUpResult = await _authService.signUpWithEmail(dto.email, dto.password);

      return signUpResult;
    }

    return result;
  }
}
