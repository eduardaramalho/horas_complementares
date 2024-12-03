import 'package:flutter/foundation.dart';

class AppNotifier<T extends Object> extends ValueNotifier<T> {
  final T initialValue;

  AppNotifier(this.initialValue) : super(initialValue);

  T get state => value;

  void setState(T data) => value = data;
  void reset() => value = initialValue;
}
