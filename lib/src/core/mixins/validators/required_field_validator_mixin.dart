mixin class RequiredFieldValidatorMixin {
  String? isValidRequiredField(dynamic value) {
    if (value == null) {
      return 'Campo obrigatório';
    }

    if (value is String && value.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }
}
