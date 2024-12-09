import 'dart:convert';

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
  final String base64File;

  const CreateActivityDto({
    required this.userId,
    required this.title,
    required this.workload,
    required this.description,
    required this.status,
    required this.category,
    required this.base64File,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'title': title,
      'workload': workload,
      'description': description,
      'statusId': status.id,
      'categoryId': category.id,
      'base64File': base64File,
    };
  }

  String toJson() => json.encode(toMap());
}
