import 'package:intl/intl.dart';

class Util {
  static String appId = '';
  static String getFormatteddate(DateTime dateTime) {
    return new DateFormat("EEE, MMM d, yy").format(dateTime);
  }
}
