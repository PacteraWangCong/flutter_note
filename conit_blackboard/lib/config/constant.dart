import 'package:flutter/material.dart';

/// Created by wangcong on 20/03/06

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class Constant {
  static const double navBarHeight = 56.0;
}

class Msg {
  static const String back = '戻る';
  static const String next = '次へ';
  static const String popYes = 'はい';
  static const String popNo = 'いいえ';
  static const String jpUnit = '円';
}

class ErrorMsg {}

class ErrorMsgId {}

class Routes {
  static const String tasKList = 'route_task_list';
  static const String login = 'route_login';
  static const String blackboard = 'route_blackboard';
}

class SpKey {}
