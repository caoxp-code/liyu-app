/// 返回结果对象
class ResultData<T> {
  int code = 200;
  T data;
  bool isTip = false; // 是否需要在前台弹出窗体
  String message;
  ResultData({this.code, this.data, this.message, this.isTip});
}