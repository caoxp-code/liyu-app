// 路由信息配置

import 'package:flutter/material.dart';
import 'package:liyu_app/pages/home.dart';
import 'package:liyu_app/splash_screen/index.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    "/splash": (context) => SplashScreen(),
    "/": (context) => HomePage(),
  };

}