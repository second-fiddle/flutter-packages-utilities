import 'object.dart';

/// 空文字か判定する。（Null考慮）
/// @param String? value チェック対象
/// @return bool true is empty, false is not empty
bool isEmpty(String? str) => isNull(str) || str!.isEmpty;

/// 空文字以外か判定する。（Null考慮）
/// @param String? value チェック対象
/// @return bool true is not null or not empty, false is null or empty
bool isNotEmpty(String? str) => !isEmpty(str);

/// 文字列長の判定を行う。チェック対処が空文字の場合、trueとする。
/// @param String str チェック対象
/// @param int min 最小文字列長
/// @param int? max 最大文字列長
/// @return bool true is within range, false is without range
bool isLength(String str, int min, [int? max]) {
  if (isEmpty(str)) {
    return true;
  }
  final int length = str.length;
  return min <= length && (max == null || length <= max);
}

/// 正規表現に一致するか判定する。
/// @param String str チェック対象
/// @param dynamic pattern 正規表現
/// @return bool is match, false is not match
bool matches(String str, pattern) =>
    isEmpty(str) || RegExp(pattern).hasMatch(str);

/// メールアドレス判定用正規表現
String _email =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$";

/// メールアドレスの書式となっているか判定する。
/// @param String str チェック対象
/// @return bool true is email, false is not email
bool isEmail(String str) => isEmpty(str) || matches(str, _email);

/// 電話番号判定用正規表現
String _tel =
    r"^(0([0-9]-[0-9]{4}|[0-9]{2}-[0-9]{3}|[0-9]{3}-[0-9]{2}|[0-9]{4}-[0-9])-[0-9]{4})|(0([0-9]-[0-9]{4}|[0-9]{2}-[0-9]{3}|[0-9]{3}[0-9]{2}|[0-9]{4}-[0-9])[0-9]{4})$";
String _mobile = r"^((070|080|090)-[0-9]{4}-[0-9]{4})|(070|080|090)[0-9]{8}$";
String _ipTel = r"^(050-[0-9]{4}-[0-9]{4})|(050[0-9]{8})$";

/// 電話番号の書式となっているか判定する。
/// @param String str チェック対象
/// @return bool true is phone number, false is not phone number
bool isPhoneNumber(String str) =>
    isEmpty(str) ||
    (matches(str, _tel) || matches(str, _mobile) || matches(str, _ipTel));

/// URL判定用正規表現
String _url =
    r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)';

/// URLの書式となっているか判定する。
/// @param String str チェック対象
/// @return bool true is url, false is not url
bool isUrl(String str) => isEmpty(str) || matches(str, _url);

/// 数値判定用正規表現
String _number = r"^[-]?([1-9]\d*|0)(\.\d+)?$";

/// 数値の書式となっているか判定する。
/// @param String str チェック対象
/// @return bool true is number, false is not number
bool isNumber(String str) => isEmpty(str) || matches(str, _number);

/// 整数判定用正規表現
String _integer = r"^[-]?([1-9]\d*|0)$";

/// 整数の書式となっているか判定する。
/// @param String str チェック対象
/// @return bool true is integer, false is not integer
bool isInteger(String str) => isEmpty(str) || matches(str, _integer);

/// 正の整数判定用正規表現
String _digits = r"^([1-9]\d*)$";

/// 正の整数の書式となっているか判定する。
/// @param String str チェック対象
/// @return bool true is digits, false is not digits
bool isDigits(String str) => isEmpty(str) || matches(str, _digits);

/// 英字判定用正規表現
String _alpha = r"^[a-zA-Z]+$";

/// 英字の書式となっているか判定する。
/// @param String str チェック対象
/// @return bool true is alpha, false is not alpha
bool isAlpha(String str) => isEmpty(str) || matches(str, _alpha);

/// 英数字判定用正規表現
String _alphanumeric = r"^[a-zA-Z0-9]+$";

/// 英字数字の書式となっているか判定する。
/// @param String str チェック対象
/// @return bool true is alpha & numeric, false is not alpha & numeric
bool isAlphanumeric(String str) => isEmpty(str) || matches(str, _alphanumeric);

/// 半角文字判定用正規表現
String _halfWidth =
    r'[\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]';

/// 半角のみで構成されているか判定する。
/// @param String str チェック対象
/// @return bool true is half character, false is not half character
bool isHalfWidth(String str) {
  if (isEmpty(str)) {
    return true;
  }
  return str.replaceAll(RegExp(_halfWidth), '').length == 0;
}

/// 全角文字判定用正規表現
String _fullWidth =
    r'[^\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]';

/// 全角のみで構成されているか判定する。
/// @param String str チェック対象
/// @return bool true is full character, false is not full character
bool isFullWidth(String str) {
  if (isEmpty(str)) {
    return true;
  }
  return str.replaceAll(RegExp(_fullWidth), '').length == 0;
}
