import 'package:dio/dio.dart';

import 'package:liyu_app/common/net/modals/result_data.dart';

// 将返回信息转换为resultdata类型
class ResponseInterceptor extends  InterceptorsWrapper{
  @override
  Future onResponse(Response response) async{
    RequestOptions options = response.request;
    ResultData value;
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        String message = response.data != null ? response.data['message'] : null;
        if (message == null) {
          value = ResultData(code: response.statusCode, data: response.data);
        } else {
          value = ResultData(code: response.statusCode, data: response.data, message: message, isTip: true);
        }
      }
      
    } on DioError catch (e) {
      // 判断e 的类型
      DioErrorType type = e.type;
      String message = '';
      if (type == DioErrorType.CONNECT_TIMEOUT || type == DioErrorType.RECEIVE_TIMEOUT) {
        message = '连接超时，请稍后重试!';
      } else if (type != DioErrorType.CANCEL) {
        message = e.message;
      }
      if (message.isNotEmpty) {
        value = ResultData(code: response.statusCode, message: message);
      }
    } catch (e) {
      print('Dio error, query path:' + options.path + '; message:' + e.toString());
      value = ResultData(code: response.statusCode, message: e.toString());
    }
    return value;
  }
}