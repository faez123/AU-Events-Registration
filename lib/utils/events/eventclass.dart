import 'package:intl/intl.dart';

class Event {
  late final String name;
  late final String description;
  late final String pictureURL;
  late final String pageURL;
  dynamic date;

  Event(
    this.name,
    this.description,
    this.pictureURL,
    this.pageURL,
    this.date,
  );

  void stringToDateTime() {
    if (date.runtimeType == String) {
      date = DateTime.parse(date);
    }
  }

  void dateTimeToString() {
    if (date.runtimeType == DateTime) {
      date = DateFormat("yyyy-MM-dd").format(date);
    }
  }

  String getDateStringFormat() {
    if (date.runtimeType == DateTime) {
      dateTimeToString();
    }
    return date;
  }
}
