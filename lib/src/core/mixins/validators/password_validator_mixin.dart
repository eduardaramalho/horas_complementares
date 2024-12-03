mixin class PasswordValidatorMixin {
  String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Senha obrigatória';
    }

    if (password.length < 6) {
      return 'Senha deve ter no mínimo 6 caracteres';
    }

    return null;
  }
}
