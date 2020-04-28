import 'package:dio/dio.dart';

import 'package:liyu_app/common/net/interceptors/response_interceptor.dart';
import 'package:liyu_app/common/config/config.dart';
import 'package:liyu_app/common/net/interceptors/error_interceptor.dart';
import 'package:liyu_app/common/net/interceptors/token_interceptor.dart';

/// 封装Dio类，供外部使用
class HttpManager {
  static const String contentTypeJson = 'application/json';
  static const String contentTypeForm = 'application/x-www-form-urlencoded';
  static const String getTokenPath = '/token';
  BaseOptions options = BaseOptions(
    baseUrl: SysConfig.apiRoot,
    connectTimeout:  SysConfig.connectTimeout,
    receiveTimeout: SysConfig.receiveTimeout
  );
  Dio _dio;

  // 私有构造函数
  HttpManager._() {
    _dio = Dio(options);
    // 添加token拦截器
    _dio.interceptors.add(TokenInterceptor(_dio, getTokenPath, options));
    // 添加dio的拦截器
    _dio.interceptors.add(ErrorInterceptor(_dio));
    // 拦截返回信息，转换成ResultData数据
    _dio.interceptors.add(ResponseInterceptor());
  }

  static HttpManager _instance = HttpManager._();

  // 使用factory关键字返回单例对象
  factory HttpManager() => _shareInstance();

  static HttpManager _shareInstance() => _instance;



}