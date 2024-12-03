import '../../../../core/contracts/app_notifier.dart';
import '../../domain/usecases/verify_user_is_logged_usecase.dart';
import 'states/splash_state.dart';

class SplashController extends AppNotifier<SplashState> {
  final VerifyUserIsLoggedUsecase _verifyUserIsLoggedUsecase;

  SplashController(this._verifyUserIsLoggedUsecase) : super(const InitialSplashState());

  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLogged = await _verifyUserIsLoggedUsecase.execute();

    return isLogged.success;
  }
}
