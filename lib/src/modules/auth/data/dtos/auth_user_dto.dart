import '../../../../core/contracts/contracts.dart';

class AuthUserDto extends DTO {
  final String email;
  final String password;

  const AuthUserDto({
    required this.email,
    required this.password,
  });
}
