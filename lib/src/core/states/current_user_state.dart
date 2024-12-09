import 'package:flutter/foundation.dart';

import '../models/user_model.dart';

class CurrentUserState {
  static ValueNotifier<UserModel?> _userListener = ValueNotifier(null);
  static void setUser(UserModel? id) => _userListener.value = id;
  static String get userId => _userListener.value!.id;
  static String get userEmail => _userListener.value!.email;
  static String get userName => _userListener.value!.name;
}
