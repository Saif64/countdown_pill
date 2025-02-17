import 'package:countdown_pill/src/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test DateFormatter', () {
    final targetDate = DateTime.now().add(Duration(days: 2, hours: 5));
    expect(
      DateFormatter.formatRemainingTime(targetDate,
          format: 'd days H hours M minutes remaining'),
      '2 days 5 hours 0 minutes remaining',
    );
  });
}
