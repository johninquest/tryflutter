
liveClock() {
  var dt = new DateTime.now();
  var dayNow = dt.day;
  var monthNow = dt.month;
  var yearNow = dt.year;
  var hourNow = dt.hour;
  var minuteNow = dt.minute;
  var secondNow = dt.second;
  return 'Date: $dayNow.$monthNow.$yearNow \nTime: $hourNow:$minuteNow:$secondNow';
}
