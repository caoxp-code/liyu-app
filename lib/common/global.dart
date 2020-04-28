import 'package:liyu_app/common/utils/style_utils.dart';

///全局变量存储，需要在app执行之前运行
class Global {
  static init() async {
    StyleUtil();
  }
}