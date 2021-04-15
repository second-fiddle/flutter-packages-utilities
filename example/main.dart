import '../lib/utilities.dart';
import 'package:intl/intl.dart';

void main() {
  _checkDateTime();
  _checkNumber();
  _checkObject();
  _checkString();
}

_checkDateTime() {
  bool result;

  // datetime.dart(isDate)
  result = isDate('2021-04-31');
  print("isDate(2021-04-31)=$result");
  result = isDate('2021-04-30');
  print("isDate(2021-04-30)=$result");
  result = isDate('2021/04/30', 'y/M/d');
  print("isDate(2021/04/30)=$result");
  result = isDate('2021-4-1');
  print("isDate(2021-4-1)=$result");

  DateTime tod = today();
  String todStr = DateFormat('y-M-d').format(tod);
  DateTime tom = today();
  tom = tom.add(Duration(days: 1));
  String tomStr = DateFormat('y-M-d').format(tom);
  DateTime yes = today();
  yes = yes.add(Duration(days: -1));
  String yesStr = DateFormat('y-M-d').format(yes);

  // datetime.dart(isBefore)
  result = isBefore(todStr);
  print("isBefore(today<today)=$result");
  result = isBefore(todStr, tod);
  print("isBefore(today<today)=$result");
  result = isBefore(todStr, tom);
  print("isBefore(today<tomorrow)=$result");
  result = isBefore(todStr, yes);
  print("isBefore(today<yesterday)=$result");

  // datetime.dart(isTodayBefore)
  result = isTodayBefore(todStr);
  print("isTodayBefore(today<=today)=$result");
  result = isTodayBefore(todStr, tod);
  print("isTodayBefore(today<=today)=$result");
  result = isTodayBefore(todStr, tom);
  print("isTodayBefore(today<=tomorrow)=$result");
  result = isTodayBefore(todStr, yes);
  print("isTodayBefore(today<=yesterday)=$result");

  // datetime.dart(isToday)
  result = isToday(todStr);
  print("isToday(today=today)=$result");
  result = isToday(yesStr);
  print("isToday(today=yesterday)=$result");

  // datetime.dart(isAfter);
  result = isAfter(todStr);
  print("isAfter(today>today)=$result");
  result = isAfter(todStr, tod);
  print("isAfter(today>today)$result");
  result = isAfter(todStr, tom);
  print("isAfter(today>tomorrow)=$result");
  result = isAfter(todStr, yes);
  print("isAfter(today>yesterday)=$result");

  // datetime.dart(isTodayAfter)
  result = isTodayAfter(todStr);
  print("isTodayAfter(today>=today)=$result");
  result = isTodayAfter(todStr, tod);
  print("isTodayAfter(today>=today)=$result");
  result = isTodayAfter(todStr, tom);
  print("isTodayAfter(today>=tomorrow)=$result");
  result = isTodayAfter(todStr, yes);
  print("isTodayAfter(today>=yesterday)=$result");
}

_checkNumber() {
  bool result;

  // number.dart(isGt)
  result = isGt("5", 5);
  print("isGt(5>5)=$result");
  result = isGt("5", 4);
  print("isGt(5>4)=$result");
  // number.dart(isGte)
  result = isGte("5", 6);
  print("isGte(5>=6)=$result");
  result = isGte("5", 5);
  print("isGte(5>=5)=$result");
  result = isGte("5", 4);
  print("isGte(5>4)=$result");
  // number.dart(isLt);
  result = isLt("5", 6);
  print("isLt(5<6)=$result");
  result = isLt("5", 5);
  print("isLt(5<5)=$result");
  // number.dart(isLte)
  result = isLte("5", 6);
  print("isGte(5<=6)=$result");
  result = isLte("5", 5);
  print("isGte(5<=5)=$result");
  result = isLte("5", 4);
  print("isGte(5<=4)=$result");
  // number.dart(isRange)
  result = isRange("5", 0, 4);
  print("isRange(0<=5<=4)=$result");
  result = isRange("5", 5, 5);
  print("isRange(5<=5<=5)=$result");
  result = isRange("5", 4, 6);
  print("isRange(4<=5<=6)=$result");
  result = isRange("5", 6, 8);
  print("isRange(6<=5<=8)=$result");
  result = isRange("5", 0, 4, false);
  print("isRange(0<5<4)=$result");
  result = isRange("5", 5, 5, false);
  print("isRange(5<5<5)=$result");
  result = isRange("5", 4, 6, false);
  print("isRange(4<5<6)=$result");
  result = isRange("5", 6, 8, false);
  print("isRange(6<5<8)=$result");
}

_checkObject() {
  bool result;

  // object.dart(isNull)
  result = isNull(null);
  print("isNull(null=null)=$result");
  result = isNull({});
  print("isNull(null={}=$result");

  // object.dart(isNotNull)
  result = isNotNull(null);
  print("isNotNull(null=null)=$result");
  result = isNotNull({});
  print("isNotNull(null={}=$result");

  // object.dart(equals)
  result = equals({}, {});
  print("equals({}={}=$result");
  result = equals({}, 5);
  print("equals({}=5=$result");
}

_checkString() {
  bool result;

  // string.dart(isEmpty)
  result = isEmpty(null);
  print("isEmpty(null=null)=$result");
  result = isEmpty("");
  print("isEmpty(length=0)=$result");
  result = isEmpty("12345");
  print("isEmpty(length=5)=$result");

  // string.dart(isNotEmpty)
  result = isNotEmpty(null);
  print("isNotEmpty(null=null)=$result");
  result = isNotEmpty("");
  print("isNotEmpty(length=0)=$result");
  result = isNotEmpty("12345");
  print("isNotEmpty(length=5)=$result");

  // string.dart(isLength(minLength))
  result = isLength("123", 3);
  print("isLength(3<=3)=$result");
  result = isLength("123", 4);
  print("isLength(4<=3)=$result");

  // string.dart(isLength(maxLength))
  result = isLength("123", 0, 3);
  print("isLength(3<=3)=$result");
  result = isLength("123", 0, 2);
  print("isLength(3<=2)=$result");

  // string.dart(isLength(length))
  result = isLength("12", 2, 4);
  print("isLength(2<=2<=4)=$result");
  result = isLength("1", 2, 4);
  print("isLength(2<=1<=4)=$result");
  result = isLength("1234", 2, 4);
  print("isLength(2<=4<=4)=$result");
  result = isLength("12345", 2, 4);
  print("isLength(2<=5<=4)=$result");

  // string.dart(isEmail)
  result = isEmail("second-fiddle@example.com");
  print("isEmail(second-fiddle@example.com)=$result");
  result = isEmail("second-fiddle");
  print("isEmail(second-fiddle)=$result");
  result = isEmail("second-fiddle@");
  print("isEmail(second-fiddle@)=$result");
  result = isEmail("second-fiddle@example");
  print("isEmail(second-fiddle@example)=$result");

  // string.dart(isPhoneNumber)
  result = isPhoneNumber("03-1234-5678");
  print("isPhoneNumber(03-1234-5678)=$result");
  result = isPhoneNumber("099-123-4567");
  print("isPhoneNumber(099-123-4567)=$result");
  result = isPhoneNumber("0999-12-3456");
  print("isPhoneNumber(0999-12-3456)=$result");
  result = isPhoneNumber("070-1234-5678");
  print("isPhoneNumber(070-1234-5678)=$result");
  result = isPhoneNumber("080-1234-5678");
  print("isPhoneNumber(080-1234-5678)=$result");
  result = isPhoneNumber("090-1234-5678");
  print("isPhoneNumber(090-1234-5678)=$result");
  result = isPhoneNumber("050-1234-5678");
  print("isPhoneNumber(050-1234-5678)=$result");

  result = isPhoneNumber("0312345678");
  print("isPhoneNumber(0312345678)=$result");
  result = isPhoneNumber("0991234567");
  print("isPhoneNumber(0991234567)=$result");
  result = isPhoneNumber("0999123456");
  print("isPhoneNumber(0999123456)=$result");
  result = isPhoneNumber("07012345678");
  print("isPhoneNumber(07012345678)=$result");
  result = isPhoneNumber("08012345678");
  print("isPhoneNumber(08012345678)=$result");
  result = isPhoneNumber("09012345678");
  print("isPhoneNumber(09012345678)=$result");
  result = isPhoneNumber("05012345678");
  print("isPhoneNumber(05012345678)=$result");

  result = isPhoneNumber("a");
  print("isPhoneNumber(a)=$result");

  // string.dart(isUrl)
  result = isUrl("http://www.yahoo.com");
  print("isUrl(http://www.yahoo.com)=$result");
  result = isUrl("http://yahoo.com");
  print("isUrl(http://yahoo.com)=$result");
  result = isUrl("https://www.yahoo.com");
  print("isUrl(https://www.yahoo.com)=$result");
  result = isUrl("https://yahoo.com");
  print("isUrl(https://yahoo.com)=$result");
  result = isUrl("http://www.yahoo.co.jp");
  print("isUrl(http://www.yahoo.co.jp)=$result");
  result = isUrl("http://www.yahoo");
  print("isUrl(http://www.yahoo)=$result");
  result = isUrl("https://yahoo");
  print("isUrl(https://yahoo)=$result");

  // string.dart(isNumber)
  result = isNumber("-1");
  print("isNumber(-1)=$result");
  result = isNumber("0");
  print("isNumber(0)=$result");
  result = isNumber("1");
  print("isNumber(1)=$result");
  result = isNumber("0.1");
  print("isNumber(0.1)=$result");
  result = isNumber("-0.1");
  print("isNumber(-0.1)=$result");
  result = isNumber("a");
  print("isNumber(a)=$result");

  // string.dart(isInteger)
  result = isInteger("-1");
  print("isInteger(-1)=$result");
  result = isInteger("0");
  print("isInteger(0)=$result");
  result = isInteger("1");
  print("isInteger(1)=$result");
  result = isInteger("0.1");
  print("isInteger(0.1)=$result");
  result = isInteger("-0.1");
  print("isInteger(-0.1)=$result");

  // string.dart(isDigits)
  result = isDigits("-1");
  print("isDigits(-1)=$result");
  result = isDigits("0");
  print("isDigits(0)=$result");
  result = isDigits("1");
  print("isDigits(1)=$result");
  result = isDigits("0.1");
  print("isDigits(0.1)=$result");
  result = isDigits("-0.1");
  print("isDigits(-0.1)=$result");

  // string.dart(isAlpha)
  result = isAlpha("abc");
  print("isAlpha(abc)=$result");
  result = isAlpha("abc1#");
  print("isAlpha(abc1#)=$result");

  // string.dart(isAlpha)
  result = isAlphanumeric("abc");
  print("isAlphanumeric(abc)=$result");
  result = isAlphanumeric("123");
  print("isAlphanumeric(123)=$result");
  result = isAlphanumeric("abc123");
  print("isAlphanumeric(abc123)=$result");
  result = isAlphanumeric("abc#");
  print("isAlphanumeric(abc#)=$result");

  // string.dart(isHalfWidth)
  result = isHalfWidth("abc#");
  print("isHalfWidth(abc#)=$result");
  result = isHalfWidth("abcＡＢＣ");
  print("isHalfWidth(abcＡＢＣ)=$result");

  // string.dart(isFullWidth)
  result = isFullWidth("ａｂｃ＃");
  print("isFullWidth(ａｂｃ＃)=$result");
  result = isFullWidth("abcＡＢＣ");
  print("isFullWidth(abcＡＢＣ)=$result");

}