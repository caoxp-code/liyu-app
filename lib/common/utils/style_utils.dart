import 'package:flutter/material.dart';

/// 根据不同手机分辨率换算设计稿中的尺寸
class StyleUtil {
  double uiWidth;
  double uiHeight;
  static StyleUtil _instance;

  // 相应尺寸,此都为逻辑像素，相当于dp
  double _screenWidth;
  double _screenHeight;
  double _pixelRatio;
  double _statusBarHeight;
  double _bottomBarHeight;
  double _textScaleFactor;

  // 单例模式，对外调用
  factory StyleUtil({double uiWidth = 750.0, double uiHeight = 1334.0}) => _getInstance(uiWidth, uiHeight);

  static StyleUtil get instance => _instance;

  StyleUtil._internal(double width, double height) {
    uiWidth = width;
    uiHeight = height;
  }

  static StyleUtil _getInstance(double width, double height) {
    if (_instance == null) {
      _instance = StyleUtil._internal(width, height);
    }
    return _instance;
  }

  void init(MediaQueryData queryData) {
    MediaQueryData _mediaQueryData = queryData;
    // 逻辑像素高
    _screenHeight = _mediaQueryData.size.height;
    // 逻辑像素宽
    _screenWidth = _mediaQueryData.size.width;
    // 像素比
    _pixelRatio = _mediaQueryData.devicePixelRatio;
    // 屏幕顶部，状态栏和刘海屏高度
    _statusBarHeight = _mediaQueryData.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
    // 单位逻辑像素字体像素数，如果设置为1.5，将会放大50%
    _textScaleFactor = _mediaQueryData.textScaleFactor;
  }
  
  /// 根据设计稿返回宽度缩放比
  double get scaleWidth => _screenWidth / uiWidth;
  /// 根据设计稿返回高度缩放比
  double get scaleHeight => _screenHeight / uiHeight;

  /// 根据设计稿上的width，返回本地的宽度，dp
  double setWidth(double width) => width * scaleWidth;

  /// 根据设计稿上的height，返回本地的宽度，dp
  double setHeight(double height) => height * scaleHeight;
  // 字体放大缩小
  double get scaleText => scaleWidth;

  // 根据比例，放大缩小字体
  double setsp(fontsize) => fontsize * scaleText;
}