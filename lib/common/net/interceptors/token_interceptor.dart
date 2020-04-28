import 'package:dio/dio.dart';
import 'package:liyu_app/common/config/config.dart';
import 'package:liyu_app/common/localStorage/index.dart';


///header中添加认证,如果header中没有token或者缓存中没有token，则需要去后台获取token信息
///需要声明当前的dio对象，获取token的接口路径，
class TokenInterceptor extends InterceptorsWrapper{
  String token;
  Dio _dio;
  String _tokenPath;
  BaseOptions _options;
  TokenInterceptor(this._dio, this._tokenPath, this._options);
  @override
  Future onRequest(RequestOptions options) async {
    //TODO: 判断此请求是否需要token，如果不需要的话，直接返回
    String token = await LocalStorage.get(SysConfig.tokenKey);
    if (token == null || token.isEmpty) {
      // 重新获取token
      // Dio _tokenDio = Dio(_options);
      // _dio.lock();
      // _tokenDio.get(_tokenPath).then((d) {
      //   // 添加token类型
      //   options.headers = d.data['data']['token'];
      //   return options;
      // }).whenComplete(() => _dio.unlock()); // 注意：whenComplete里如果返回的是Future的结果，则上次then返回的options会丢失
    } else {
      return options;
    }
  }
  // 判断是否是获取token，如果是的话，则进行保存
  // 返回状态码为200，并且返回中的字段为token
  @override
  Future onResponse(Response response) async{
    var data = response.data;
    if (response.statusCode == 200 && data['token'] != null) {
      await LocalStorage.save(SysConfig.tokenKey, data['token']);
    }
  }
}