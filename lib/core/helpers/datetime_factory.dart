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
    throw UnimplementedError();
  }

  @override
  DateTime stringToDateTime(String formattedDateTime) {
    throw UnimplementedError();
  }
}
