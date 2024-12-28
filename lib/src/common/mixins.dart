import 'package:intl/intl.dart';

mixin DateFormatAndPicker {
  DateTime formatDateApi(String? dateString) {
    if (dateString == null || dateString == 'Never') {
      return DateTime(2154);
    }
    List<String> date = dateString.split('/');

    return DateFormat('yyyy-MM-dd').parse('${date[2]}-${date[1]}-${date[0]}');
  }

  String getDateDMY(DateTime date) {
    if (date.toIso8601String().contains('2154') ||
        date.toIso8601String().contains('0001')) {
      return 'Never';
    }
    return DateFormat('dd/MM/yyyy').format(date);
  }

  getDateDetail(DateTime? date) {
    return DateFormat("d MMMM yyyy").format(date ?? DateTime.now());
  }

  getDateDetail2(DateTime? date) {
    return DateFormat("d MMM yyyy").format(date ?? DateTime.now());
  }

  getDateDetail3(DateTime? date) {
    return DateFormat("d MMM yyyy,").add_jm().format(date ?? DateTime.now());
  }

  getDayCreated(DateTime? date) {
    final int dayDifference =
        DateTime.now().difference(date ?? DateTime.now()).inDays;

    if (dayDifference > 7) return '7';
    return dayDifference.toString();
  }
}