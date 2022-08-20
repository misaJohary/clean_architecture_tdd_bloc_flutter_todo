import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  String toFormattedString() {
    if (hour == 0 && minute == 0) {
      return DateFormat('dd-MM-yyyy').format(this);
    }
    return DateFormat('dd-MM-yyyy HH:mm').format(this);
  }
}
