import 'package:flutter/foundation.dart';

class CurrentUserState {
  static ValueNotifier<String?> _userListener = ValueNotifier(null);
  static void setUserId(String? id) => _userListener.value = id;
  static String get userId => _userListener.value!;
}
