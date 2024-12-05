import 'package:flutter/material.dart';

import '../../../domain/models/activity_model.dart';

class HomeContentState {
  static final ValueNotifier<List<ActivityModel>> activities = ValueNotifier<List<ActivityModel>>([]);
  static void setActivities(List<ActivityModel> value) => activities.value = value;
}
