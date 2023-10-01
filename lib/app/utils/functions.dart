import 'dart:developer';

import 'package:intl/intl.dart';

String formatDateDDMMMMYYYY(String dateTimeString) {
  var formatter = DateFormat('dd MMMM yyyy');
  String formattedDate = "";
  try {
    // you have time in utc
    DateTime dateUtc = DateTime.parse(dateTimeString).toUtc();

// convert it to local
    formattedDate = formatter.format(dateUtc.toLocal());
  } catch (e) {}

  return formattedDate;
}

String formatDate(String date, String formatType) {
  final deliveryDate = date;
  var deliveryAt = DateTime.parse(deliveryDate);
  return DateFormat(formatType).format(deliveryAt);
}