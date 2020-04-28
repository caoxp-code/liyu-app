// 实现app的引导页。
// 引导页一般在app第一次启动时出现，第二次启动时直接跳过。
// 或者在有重大活动或节假日时，需要展示的时候，进行显示。
// 在引导页上，会有一个跳过时间按钮和一个最后一个进入软件的按钮

import 'package:flutter/material.dart';
import 'package:liyu_app/common/utils/style_utils.dart';
import 'package:liyu_app/modals/event_notification.dart';
import 'package:liyu_app/splash_screen/tick_button.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pageNum;
  List<String> titles = <String>['美元活期，随存随取', '美元定期，稳健安全', '美元理财，从理鱼开始'];
  List<String> subTitles = <String>['让全球旅行更方便', '为孩子教育早储备', '让家人健康有保障'];
  List<Widget> imgs = <Widget>[
    Image.asset(
      'statics/images/js_assets_bg_guide_one.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'statics/images/js_assets_bg_guide_two.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'statics/images/js_assets_bg_guide_three.png',
      fit: BoxFit.fill,
    ),
  ];

  

  TickButtonWidget tickButton = TickButtonWidget(
    text: '跳过',
  );

  // 添加跳转按钮
  Widget _createTickBtn() {
    return Positioned(
      child: NotificationListener<EventNotification>(
        child: tickButton,
        onNotification: (notification) {
          print(notification);
          if (notification.msg == 'splash') {
            // 跳转到其他页面
            // Navigator.of(context).pushNamed('/');
          }
          return false;
        },
      ),
      right: StyleUtil.instance.setWidth(32),
      top: StyleUtil.instance.setHeight(64),
    );
  }

  // 根据不同的页面显示不同的文案
  Widget _createTitle() {
    // print(subTitles[pageNum]);
    return Positioned(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${titles[pageNum]}',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: StyleUtil.instance.setsp(40),
                color: Color(0xFFFCFCFC),
                decoration: TextDecoration.none),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(
              '${subTitles[pageNum]}',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: StyleUtil.instance.setsp(72),
                  color: Color(0xFFFCFCFC),
                  decoration: TextDecoration.none),
            ),
          )
        ],
      ),
      left: StyleUtil.instance.setWidth(69),
      top: StyleUtil.instance.setHeight(278),
    );
  }

  @override
  void initState() {
    super.initState();
    pageNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    StyleUtil.instance.init(MediaQuery.of(context));
    return Stack(
      children: <Widget>[
        PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: onPageChanged,
            children: imgs),
        _createTickBtn(),
        _createTitle(),
      ],
    );
  }

  void onPageChanged(int pageNo) {
    setState(() {
      pageNum = pageNo;
    });
  }
}
