import 'package:intl/intl.dart';

class DateFormatHelper {
  static String formatFromServer(String dateFromServer) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
    DateTime dateTime = dateFormat.parse(dateFromServer);

    DateFormat newFormat = DateFormat('dd-MM-yyy HH:mm');
    String localeDateTime = newFormat.format(dateTime);
    return localeDateTime;
  }
}
