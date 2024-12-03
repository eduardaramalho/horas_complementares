import '../../../../core/contracts/contracts.dart';
import '../../../../core/services/services.dart';
import '../../../../core/utils/either.dart';

class VerifyUserIsLoggedUsecase implements AsyncUsecaseContract<bool> {
  final IAuthService _authService;

  const VerifyUserIsLoggedUsecase({
    required IAuthService authService,
  }) : _authService = authService;

  @override
  AsyncResult<bool> execute() async {
    final user = await _authService.getCurrentUser();

    return right(user != null);
  }
}
