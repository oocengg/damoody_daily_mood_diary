import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  DateTime copyWith({
    int? tahun,
    int? bulan,
    int? hari,
    int? jam,
    int? menit,
    int? detik,
  }) {
    tahun ??= year;
    bulan ??= month;
    hari ??= day;
    jam ??= hour;
    menit ??= minute;
    detik ??= second;

    return DateTime(tahun, bulan, hari, jam, menit, detik);
  }

  String toDateString() => DateFormat(
        'y-M-d',
      ).format(this);

  String toDateStringLong() => DateFormat(
        'yyyy-MM-dd',
      ).format(this);

  String toDMYTipe() => DateFormat(
        'd-M-y',
      ).format(this);

  String toHumanDate() => DateFormat(
        'EEEE, d MMMM y',
      ).format(this);

  String toHumanDateShort() => DateFormat(
        'E, d MMM y',
      ).format(this);

  String toHumanDateTime() {
    try {
      return DateFormat(
        'EEEE, d MMMM y HH:mm',
      ).format(this);
    } catch (e) {
      return '';
    }
  }

  String toHumanDateTimeWithoutHour() {
    try {
      return DateFormat(
        'EEEE, d MMMM y',
      ).format(this);
    } catch (e) {
      return '';
    }
  }

  String toHumanDateTimeShort() => DateFormat(
        'E, d MMM y HH:mm',
      ).format(this);

  String toHumanMonthDate() {
    try {
      return DateFormat(
        'dd MMM yyy',
      ).format(this);
    } catch (e) {
      return '';
    }
  }

  String toHumanShortMonthDate() => DateFormat(
        'd MMM yyy',
      ).format(this);

  String toHumanShortMonthWithDay() => DateFormat(
        'EE, d MMM yyy',
      ).format(this);

  String toHumanShortDay() => DateFormat(
        'EE',
      ).format(this);

  String toHumanMonthShortNoYearDate() => DateFormat(
        'd MMM',
      ).format(this);

  String toHumanBulanDate() => DateFormat(
        'MMMM yyy',
      ).format(this);

  String toHumanBulanShortDate() => DateFormat(
        'MMM yyy',
      ).format(this);

  String toHumanDay() => DateFormat(
        'd',
      ).format(this);

  String toHumanBulan() => DateFormat(
        'MMMM',
      ).format(this);

  String toHumanTime() => DateFormat(
        'HH:mm',
      ).format(this);

  String toHumanDateTimeShortWithoutYear() => DateFormat(
        'E, d MMM HH:mm',
      ).format(this);

  String toTimeInCheckClock() {
    try {
      return DateFormat(
        'HH:mm:ss',
      ).format(this);
    } catch (e) {
      return '--:--:--';
    }
  }
}
