/// オブジェクトがNullか判定する。
/// @param Object? obj チェック対象
/// @return bool true is null, false is not null
bool isNull(Object? obj) => obj == null;

/// オブジェクトがNullではないことを判定する。
/// @param Object? obj チェック対象
/// @return bool true is not null, false is null
bool isNotNull(Object? obj) => !isNull(obj);

/// オブジェクトが同値であることを判定する。
/// @param dynamic target チェック対象
/// @param dynamic comparison 比較対象
/// @return bool true is equal, false is not equal
bool equals(target, comparison) => target.toString() == comparison.toString();