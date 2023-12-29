import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimeControllerNotifier extends StateNotifier<DateTime> {
  DateTimeControllerNotifier() : super(DateTime.now());

  void setDateTime(DateTime value) {
    state = value;
  }
}

final dateTimeControllerProvider =
    StateNotifierProvider<DateTimeControllerNotifier, DateTime>(
        (ref) => DateTimeControllerNotifier());
