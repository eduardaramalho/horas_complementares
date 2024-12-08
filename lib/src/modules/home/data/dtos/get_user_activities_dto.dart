import '../../../../core/contracts/contracts.dart';

class GetUserActivitiesDto extends DTO {
  final String userId;

  const GetUserActivitiesDto({
    required this.userId,
  });
}
