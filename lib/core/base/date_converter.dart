import 'package:intl/intl.dart';

class DateConverter {
  static String formatTimestamp(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    DateTime now = DateTime.now();

    Duration difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h';
    } else if (difference.inDays < 7) {
      return 'last week';
    } else {
      DateFormat formatter = DateFormat('MMMM');
      return formatter.format(dateTime);
    }
  }
}
