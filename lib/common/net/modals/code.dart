/// 网络返回编码类
class Code {
  /// 网络错误
  static const int networkError = -1;
  static const String networkErrorMsg = '请检查网络连接';
  /// 网络超时
  static const networkTimeout = -2;
  /// 正确码
  static const success = 200;
  /// 无权限访问，
  static const noAuthorization = 401;
}