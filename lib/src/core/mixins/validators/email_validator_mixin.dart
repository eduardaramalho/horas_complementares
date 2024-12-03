mixin class EmailValidatorMixin {
  String? isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'E-mail obrigatório';
    }

    final isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

    if (!isValid) {
      return 'E-mail inválido';
    }

    return null;
  }
}
