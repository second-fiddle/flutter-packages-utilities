import 'package:intl/intl.dart';

/// 日付として妥当か判定する。
/// @param String source チェック対象
/// @param String format 日付書式(default=y-M-d)
/// @return bool true is date, false is not date
bool isDate(String source, [String format = 'y-M-d']) {
  try {
    DateFormat(format).parseStrict(source);
    return true;
  } catch (e) {
    return false;
  }
}

/// 日付が指定日以前（指定日含まない）か判定する。
/// 比較対象が未指定の場合、システム日付が比較対象となる。
/// @param String source チェック対象
/// @param DateTime? comparison 比較対象
/// @param String format 日付書式(default=y-M-d)
/// @return bool true is before, false is not before
bool isBefore(String source, [DateTime? comparison, String? format = 'y-M-d']) {
  if (!isDate(source)) {
    return false;
  }

  DateTime date = DateFormat(format).parse(source);
  DateTime target = comparison ?? today();

  return date.isBefore(target);
}

/// 日付が指定日以前（指定日含む）か判定する。
/// 比較対象が未指定の場合、システム日付が比較対象となる。
/// @param String source チェック対象
/// @param DateTime? comparison 比較対象
/// @param String format (default=y-M-d)
/// @return bool true is before, false is not before
bool isTodayBefore(String source,
    [DateTime? comparison, String format = 'y-M-d']) {
  if (!isDate(source)) {
    return false;
  }

  DateTime date = DateFormat(format).parse(source);
  DateTime target = comparison ?? today();

  return date.difference(target).inDays >= 0;
}

/// 日付がシステム日付当日か判定する。
/// @param String source チェック対象
/// @param String format 日付書式(y-M-d)
/// @return bool true is today, false is not today
bool isToday(String source, [String format = 'y-M-d']) {
  DateTime date = DateFormat(format).parse(source);
  return date.difference(today()).inDays == 0;
}

/// 日付が指定日以降（指定日含まない）か判定する。
/// 比較対象が未指定の場合、システム日付が比較対象となる。
/// @param String source チェック対象
/// @param DateTime? comparison 比較対象
/// @param String format (default=y-M-d)
/// @return bool true is after, false is not after
bool isAfter(String source, [DateTime? comparison, String format = 'y-M-d']) {
  if (!isDate(source)) {
    return false;
  }

  DateTime date = DateFormat(format).parse(source);
  DateTime target = comparison ?? today();

  return date.isAfter(target);
}

/// 日付が指定日以以降（指定日含む）か判定する。
/// 比較対象が未指定の場合、システム日付が比較対象となる。
/// @param String source チェック対象
/// @param DateTime? comparison 日付書式
/// @param String format (default=y-M-d)
/// @return bool true is after, false is not after
bool isTodayAfter(String source,
    [DateTime? comparison, String format = 'y-M-d']) {
  if (!isDate(source)) {
    return false;
  }

  DateTime date = DateFormat(format).parse(source);
  DateTime target = comparison ?? today();

  return date.difference(target).inDays <= 0;
}

/// システム日付を取得する。
/// @param String format (default=y-M-d)
/// @return DateTime
DateTime today([String format = 'y-M-d']) =>
    DateFormat(format).parse(DateTime.now().toString());
