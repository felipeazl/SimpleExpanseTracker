//converter o objeto datetime para uma string yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  //year -> yyyy
  String year = dateTime.year.toString();

  //month -> mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  //day -> dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  //final -> yyyymmdd
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
