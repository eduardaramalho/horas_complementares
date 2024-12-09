import 'dart:convert';

import '../enums/activity_categories_enum.dart';
import '../enums/activity_status_enum.dart';

class ActivityModel {
  final String id;
  final String userId;
  final String title;
  final int workload;
  final String description;
  final ActivityStatusEnum status;
  final ActivityCategoriesEnum category;
  final String base64File;

  const ActivityModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.workload,
    required this.description,
    required this.status,
    required this.category,
    required this.base64File,
  });

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      workload: map['workload'] as int,
      description: map['description'] as String,
      status: ActivityStatusEnum.fromId(map['statusId'] as int),
      category: ActivityCategoriesEnum.fromId(map['categoryId'] as int),
      base64File: map['base64File'] as String,
    );
  }

  factory ActivityModel.fromJson(String source) => ActivityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
