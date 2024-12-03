sealed class PetFormState {
  const PetFormState();

  bool get isLoading => this is LoadingPetFormState;
  bool get isLoaded => this is LoadedPetFormState;
  bool get isSending => this is SendingPetFormState;
  bool get isSuccess => this is SuccessPetFormState;
  bool get isError => this is ErrorPetFormState;
}

final class LoadingPetFormState extends PetFormState {}

final class LoadedPetFormState extends PetFormState {}

final class SendingPetFormState extends PetFormState {}

final class SuccessPetFormState extends PetFormState {}

final class ErrorPetFormState extends PetFormState {
  final String message;

  const ErrorPetFormState(this.message);
}
