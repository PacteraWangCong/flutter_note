import 'package:flutter/material.dart';
import 'app_bloc.dart';

/// 监听路由发生变化
class MyObserver extends NavigatorObserver {
  final AppBloc appBloc;

  MyObserver(this.appBloc);

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    // 屏蔽dialog的情况
    if (route is MaterialPageRoute) {
      appBloc.routeChange(RouteChangeType.push);
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    // 屏蔽dialog的情况
    if (route is MaterialPageRoute) {
      appBloc.routeChange(RouteChangeType.pop);
    }
  }

}