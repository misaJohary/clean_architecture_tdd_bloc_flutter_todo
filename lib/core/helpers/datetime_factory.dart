import 'package:intl/intl.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

abstract class DateTimeFactory {
  DateTime stringToDateTime(String formattedDateTime);
  String dateTimeToString(DateTime dateTime);
}

class DateTimeFactoryImp implements DateTimeFactory {
  @override
  String dateTimeToString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  DateTime stringToDateTime(String formattedDateTime) {
    return DateTime.parse(formattedDateTime);
  }
}
