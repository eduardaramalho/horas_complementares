sealed class ActivitiesFormState {
  const ActivitiesFormState();
}

final class InitialActivitiesFormState extends ActivitiesFormState {
  const InitialActivitiesFormState();
}

final class SendingActivitiesFormState extends ActivitiesFormState {
  const SendingActivitiesFormState();
}

final class ErrorActivitiesFormState extends ActivitiesFormState {
  final String message;

  const ErrorActivitiesFormState(this.message);
}

final class SuccessActivitiesFormState extends ActivitiesFormState {
  const SuccessActivitiesFormState();
}
