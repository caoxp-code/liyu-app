import 'dart:async';

/// 时间跳转控件
import 'package:flutter/material.dart';
import 'package:liyu_app/common/config/config.dart';
import 'package:liyu_app/modals/event_notification.dart';

/// 默认3秒，可以通过点击直接调转，也可以等待3秒后跳转
class TickButtonWidget extends StatefulWidget {
  TickButtonWidget({Key key, this.text}) : super(key: key);
  final String text;
  @override
  _TickButtonWidgetState createState() => _TickButtonWidgetState();
}

class _TickButtonWidgetState extends State<TickButtonWidget> {
  Timer _timer;
  int tick;

  void timeCallBack(Timer timer) {
    int t = timer.tick;
    setState(() {
      tick = SysConfig.splashTimeTick - t;
    });
    if (SysConfig.splashTimeTick - t <= 0) {
      // 触发事件通知，跳转到首页
      EventNotification('splash').dispatch(context);
      _timer.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    tick = SysConfig.splashTimeTick;
    startTick();
  }

  startTick() {
    _timer = Timer.periodic(Duration(seconds: 1), timeCallBack);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void onBtnPress() {
    EventNotification('splash').dispatch(context);
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.text} ${tick}s');
    return OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.white,
      onPressed: onBtnPress,
      child: Text('${widget.text} ${tick}s'),
    );
  }
}
