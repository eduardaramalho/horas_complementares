class UserModel {
  final String id;
  final String email;

  const UserModel({
    required this.id,
    required this.email,
  });

  String get name {
    final withoutEmail = email.split('@').first;

    return withoutEmail.split('.').map((e) {
      final firstLetter = e.substring(0, 1).toUpperCase();
      final rest = e.substring(1);

      return '$firstLetter$rest';
    }).join(' ');
  }
}
