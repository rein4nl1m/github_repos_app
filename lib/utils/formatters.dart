import 'package:date_format/date_format.dart';

String dateFormatted(String date){
  var dateParsed = DateTime.parse(date);
  return formatDate(dateParsed, [dd, '/', mm, "/", yyyy]);
}