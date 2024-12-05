import '../../../../core/contracts/app_notifier.dart';
import '../../data/dtos/auth_user_dto.dart';
import '../../domain/usecases/login_user_usecase.dart';
import '../../domain/usecases/signup_user_usecase.dart';
import 'states/auth_state.dart';

class AuthController extends AppNotifier<AuthState> {
  final LoginUserUsecase _loginUserUsecase;
  final SignUpUserUsecase _signUpUserUsecase;

  AuthController(
    this._loginUserUsecase,
    this._signUpUserUsecase,
  ) : super(const InitialAuthState());

  String email = '';
  void setEmail(String value) => email = value;

  String password = '';
  void setPassword(String value) => password = value;

  Future<void> login() async {
    // TODO implements login
    return setState(const SuccessAuthState());

    final result = await _loginUserUsecase.execute(
      AuthUserDto(
        email: email,
        password: password,
      ),
    );

    result.fold((error) {
      setState(ErrorAuthState(error.message));
    }, (success) {
      setState(const SuccessAuthState());
    });
  }
}
