import 'package:intl/intl.dart';

class Util {
  static String getFormattedTime(DateTime dateTime) {
    return DateFormat('Hm').format(dateTime);
  }
  static String getFormattedWeekDay(DateTime dateTime) {
    return DateFormat('EEEE').format(dateTime);
  }
}
