import 'string.dart';

/// 指定した値より大きいか判定する。
/// @param String value チェック対象
/// @param int comparison 比較対象
/// @return bool true is greater, false is not greater
bool isGt(String value, int comparison) =>
    isEmpty(value) || toInt(value) > comparison;

/// 指定した値以上か判定する。
/// @param String value チェック対象
/// @param String comparison 比較対象
/// @return bool true is greater than equal, false is not greater than equal
bool isGte(String value, int comparison) =>
    isEmpty(value) || toInt(value) >= comparison;

/// 指定した値未満か判定する。
/// @param String value チェック対象
/// @param String comparison 比較対象
/// @return bool true is less, false is not less
bool isLt(String value, int comparison) =>
    isEmpty(value) || toInt(value) < comparison;

/// 指定した値以下か判定する。
/// @param String value チェック対象
/// @param String comparison 比較対象
/// @return bool true is less than equal, false is not less than equal
bool isLte(String value, int comparison) =>
    isEmpty(value) || toInt(value) <= comparison;

/// 指定した範囲内か判定する。指定範囲の境界を含む・含まないの制御は可能。
/// @param String value チェック対象
/// @param String min 最小値
/// @param String max 最大値
/// @param bool eq true is 境界含む, false is 境界含まない
/// @return bool true is within range , false is without range
bool isRange(String value, int min, int max, [bool eq = true]) {
  if (isEmpty(value)) {
    return true;
  }
  final int comparison = toInt(value);
  if (eq) {
    return min <= comparison && comparison <= max;
  } else {
    return min < comparison && comparison < max;
  }
}

/// 整数に変換する。
/// @param String value 変換対象
/// @return int 変換結果
int toInt(String value) => toDouble(value).toInt();

/// 小数に変換する。
/// @param String value 変換対象
/// @return double 変換結果
double toDouble(String value) => double.parse(value);
