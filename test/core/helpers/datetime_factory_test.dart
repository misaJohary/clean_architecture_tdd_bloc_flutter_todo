import 'package:flutter_test/flutter_test.dart';
import 'package:my_todo_clean/core/helpers/datetime_factory.dart';

void main() {
  group('OnlyDateCompare', () {
    test(
      'same date same time',
      () {
        expect(DateTime.now().isSameDate(DateTime.now()), true);
      },
    );

    test(
      'same date different time',
      () {
        expect(
            DateTime.now().isSameDate(
              DateTime.now().add(
                const Duration(hours: 1),
              ),
            ),
            true);
      },
    );

    test(
      'different date same time',
      () {
        expect(
            DateTime.now().isSameDate(
              DateTime.now().add(
                const Duration(hours: 24),
              ),
            ),
            false);
      },
    );

    test(
      'different date different time',
      () {
        expect(
            DateTime.now().isSameDate(
              DateTime.now().add(
                const Duration(hours: 26),
              ),
            ),
            false);
      },
    );
  });

  group('DateTime to string', () {
    test(
      'with minute and second',
      () {
        final date = DateTime(2022, 10, 24, 13, 30);

        expect(date.toFormattedString(), '24-10-2022 13:30');
      },
    );

    test(
      'without minute and second',
      () {
        final date = DateTime(2022, 10, 24);

        expect(date.toFormattedString(), '24-10-2022');
      },
    );
  });
}
