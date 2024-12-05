sealed class HomeState {
  const HomeState();
}

final class InitialHomeState extends HomeState {
  const InitialHomeState();
}

final class LoadingHomeState extends HomeState {
  const LoadingHomeState();
}

final class ErrorHomeState extends HomeState {
  final String message;

  const ErrorHomeState(this.message);
}

final class LoadedHomeState extends HomeState {
  const LoadedHomeState();
}
