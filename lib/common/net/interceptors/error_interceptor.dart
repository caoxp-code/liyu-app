// 截取处理错误信息
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:liyu_app/common/net/modals/code.dart';
import 'package:liyu_app/common/net/modals/result_data.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  ErrorInterceptor(this._dio);
  Dio _dio;
  
  @override
  Future onRequest(RequestOptions options) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // 没有联网
      _dio.resolve(ResultData(code: Code.networkError, message: Code.networkErrorMsg, isTip: true, data: null));
    }
    return options;
  }
}
