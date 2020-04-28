import 'package:flutter/material.dart';

// 事件通知类
class EventNotification extends Notification {
  EventNotification(this.msg);
  final String msg;
}