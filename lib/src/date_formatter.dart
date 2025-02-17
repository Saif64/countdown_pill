class DateFormatter {
  static String formatRemainingTime(DateTime targetDate,
      {String format = '{d} days {H}H {M}M {S}S remaining'}) {
    final now = DateTime.now();
    final difference = targetDate.difference(now);

    if (difference.isNegative) {
      return 'Event has passed';
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    return format
        .replaceAll('{d}', '$days')
        .replaceAll('{H}', '$hours')
        .replaceAll('{M}', '$minutes')
        .replaceAll('{S}', '$seconds');
  }
}
