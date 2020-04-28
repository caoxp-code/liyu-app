/// 系统的一些配置信息
class SysConfig {
  static bool debug = false;

  static String apiRoot = 'http://localhost:3000/api';
  static int connectTimeout = 5000;
  static int receiveTimeout = 3000; 

  static String tokenKey = '_token_';
  static int splashTimeTick = 5; // 引导页倒计时

}