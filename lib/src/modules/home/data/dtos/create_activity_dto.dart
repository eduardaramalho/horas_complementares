import '../../../../core/contracts/contracts.dart';
import '../../domain/enums/activity_categories_enum.dart';
import '../../domain/enums/activity_status_enum.dart';

class CreateActivityDto extends DTO {
  final String userId;
  final String title;
  final int workload;
  final String description;
  final ActivityStatusEnum status;
  final ActivityCategoriesEnum category;

  const CreateActivityDto({
    required this.userId,
    required this.title,
    required this.workload,
    required this.description,
    required this.status,
    required this.category,
  });
}
