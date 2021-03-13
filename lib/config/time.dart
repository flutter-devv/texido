import 'package:intl/intl.dart';

class DateTimeFormatter {
  String getTime(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }

  getDate(DateTime date) {
    return DateFormat('h:mm a EEEE, MMM d, yyyy').format(date);
  }
}
