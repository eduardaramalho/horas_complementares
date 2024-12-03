sealed class AuthState {
  const AuthState();
}

final class InitialAuthState extends AuthState {
  const InitialAuthState();
}

final class SendingAuthState extends AuthState {
  const SendingAuthState();
}

final class SuccessAuthState extends AuthState {
  const SuccessAuthState();
}

final class ErrorAuthState extends AuthState {
  final String message;

  const ErrorAuthState(this.message);
}
