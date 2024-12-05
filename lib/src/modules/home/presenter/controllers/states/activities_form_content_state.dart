import 'package:flutter/foundation.dart';

import '../../../domain/enums/activity_categories_enum.dart';

class ActivitiesFormContentState {
  static ValueNotifier<int> workload = ValueNotifier<int>(0);
  static void setWorkload(int value) => workload.value = value;

  static ActivityCategoriesEnum? category;
  static void setCategory(ActivityCategoriesEnum value) => category = value;

  static String name = '';
  static void setName(String value) => name = value;

  static String description = '';
  static void setDescription(String value) => description = value;
}
