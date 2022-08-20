import 'package:intl/intl.dart';

extension StringExtension on String {
  /// Checks if string is a valid username.
  bool get isUsername =>
      hasMatch(this, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  /// Checks if string is URL.
  bool get isURL => hasMatch(this,
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");

  /// Checks if string is email.
  bool get isEmail => hasMatch(this,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if string is phone number.
  bool get isPhoneNumber {
    if (length > 16 || length < 9) {
      return false;
    }
    return hasMatch(this, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Checks if string is DateTime (UTC or Iso8601).
  bool get isDateTime =>
      hasMatch(this, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');

  /// String to datetime
  DateTime toDateTime() {
    try {
      return DateTime.parse(this);
    } on FormatException {
      final date = split(' ').first;
      List<String> dates = date.split('-');
      if (dates.length == 1) {
        dates = date.split('/');
        if (dates.first.length == 4) {
          if (length < 11) {
            return DateFormat('yyyy/MM/dd').parse(this);
          }
          return DateFormat('yyyy/MM/dd HH:mm').parse(this);
        }
        if (length < 11) {
          return DateFormat('dd/MM/yyyy').parse(this);
        }
        return DateFormat('dd/MM/yyyy HH:mm').parse(this);
      }
      if (dates.first.length == 4) {
        if (length < 11) {
          return DateFormat('yyyy-MM-dd').parse(this);
        }
        return DateFormat('yyyy-MM-dd HH:mm').parse(this);
      }
      if (length < 11) {
        return DateFormat('dd-MM-yyyy').parse(this);
      }
      return DateFormat('dd-MM-yyyy HH:mm').parse(this);
    }
  }

  DateTime toDateTimeDateOnly() {
    final dateOnly = split(' ').first;
    List<String> dates = dateOnly.split('-');
    if (dates.length == 1) {
      dates = dateOnly.split('/');
      if (dates.first.length == 4) {
        return DateFormat('yyyy/MM/dd').parse(dateOnly);
      }
      return DateFormat('dd/MM/yyyy').parse(dateOnly);
    }
    if (dates.first.length == 4) {
      return DateFormat('yyyy-MM-dd').parse(dateOnly);
    }
    return DateFormat('dd-MM-yyyy').parse(dateOnly);
  }
}

bool hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}
