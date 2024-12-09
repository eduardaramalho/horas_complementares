import '../../../../core/contracts/contracts.dart';
import '../../../../core/services/services.dart';
import '../../../../core/utils/either.dart';

class SignOutUserUsecase implements AsyncUsecaseContract<bool> {
  final IAuthService _authService;

  const SignOutUserUsecase({
    required IAuthService authService,
  }) : _authService = authService;

  @override
  AsyncResult<bool> execute() async {
    return await _authService.signOut();
  }
}
