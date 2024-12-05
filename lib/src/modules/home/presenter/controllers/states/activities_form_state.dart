sealed class ActivitiesFormState {
  const ActivitiesFormState();
}

final class InitialActivitiesFormState extends ActivitiesFormState {
  const InitialActivitiesFormState();
}

final class LoadingActivitiesFormState extends ActivitiesFormState {
  const LoadingActivitiesFormState();
}

final class ErrorActivitiesFormState extends ActivitiesFormState {
  final String message;

  const ErrorActivitiesFormState(this.message);
}

final class LoadedActivitiesFormState extends ActivitiesFormState {
  const LoadedActivitiesFormState();
}
