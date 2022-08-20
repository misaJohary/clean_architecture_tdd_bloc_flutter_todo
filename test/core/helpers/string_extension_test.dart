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

  group('date time test with hour', () {
    test(
      'yyyy-MM-dd HH:mm',
      () {
        const date = '2022-10-24 13:23';
        expect(date.toDateTime(), DateTime(2022, 10, 24, 13, 23));
      },
    );

    test(
      'dd-MM-yyyy HH:mm',
      () {
        const date = '24-10-2022 14:21';
        expect(date.toDateTime(), DateTime(2022, 10, 24, 14, 21));
      },
    );

    test(
      'dd/MM/yyyy HH:mm',
      () {
        const date = '24/10/2022 14:21';
        expect(date.toDateTime(), DateTime(2022, 10, 24, 14, 21));
      },
    );

    test(
      'yyyy/MM/dd HH:mm',
      () {
        const date = '2022/10/24 14:21';
        expect(date.toDateTime(), DateTime(2022, 10, 24, 14, 21));
      },
    );
  });

  group('date time test without hour', () {
    test(
      'yyyy-MM-dd',
      () {
        const date = '2022-10-24';
        expect(date.toDateTime(), DateTime(2022, 10, 24));
      },
    );

    test(
      'dd-MM-yyyy',
      () {
        const date = '24-10-2022';
        expect(date.toDateTime(), DateTime(2022, 10, 24));
      },
    );

    test(
      'dd/MM/yyyy',
      () {
        const date = '24/10/2022';
        expect(date.toDateTime(), DateTime(2022, 10, 24));
      },
    );

    test(
      'yyyy/MM/dd',
      () {
        const date = '2022/10/24';
        expect(date.toDateTime(), DateTime(2022, 10, 24));
      },
    );
  });

  group('dateTimeDateOnly', () {
    test(
      'yyyy-MM-dd HH:mm',
      () {
        const date = '2022-10-24 13:23';
        expect(date.toDateTimeDateOnly(), DateTime(2022, 10, 24));
      },
    );

    test(
      'dd-MM-yyyy HH:mm',
      () {
        const date = '24-10-2022 14:21';
        expect(date.toDateTimeDateOnly(), DateTime(2022, 10, 24));
      },
    );

    test(
      'dd/MM/yyyy HH:mm',
      () {
        const date = '24/10/2022 14:21';
        expect(date.toDateTimeDateOnly(), DateTime(2022, 10, 24));
      },
    );

    test(
      'yyy/MM/dd HH:mm',
      () {
        const date = '2022/10/24 14:21';
        expect(date.toDateTimeDateOnly(), DateTime(2022, 10, 24));
      },
    );
  });
}
