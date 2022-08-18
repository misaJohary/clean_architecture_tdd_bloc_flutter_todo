import 'package:flutter_test/flutter_test.dart';
import 'package:my_todo_clean/core/helpers/string_extension.dart';

void main() {
  group(
    'Number test',
    () {
      test(
        'Should return true',
        () async {
          const String number = '0345435433';
          expect(number.isPhoneNumber, true);
        },
      );

      test(
        'Should return false',
        () async {
          const String number = '034543543mi';
          expect(number.isPhoneNumber, false);
        },
      );
    },
  );

  group(
    'Email test',
    () {
      test(
        'Should return true',
        () async {
          const String number = 'misa@gmail.com';
          expect(number.isEmail, true);
        },
      );

      test(
        'Should return false',
        () async {
          const String number = 'misa@gmail';
          expect(number.isEmail, false);
        },
      );

      test(
        'Should return false',
        () async {
          const String number = 'misa@gmail.com ';
          expect(number.isEmail, false);
        },
      );
    },
  );
}
