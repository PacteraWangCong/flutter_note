import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

/// Created by wangcong

enum RouteChangeType { push, pop, remove, replace, start, tab }

class AppBloc extends BlocBase {

  /// 监听显示的路由变换
  BehaviorSubject<RouteChangeType> _routeChangeData = BehaviorSubject<RouteChangeType>();
  Sink<RouteChangeType> get _routeChangeSink => _routeChangeData.sink;
  Stream<RouteChangeType> get routeChangeStream => _routeChangeData.stream;


  void routeChange(RouteChangeType type) {
    _routeChangeSink.add(type);
  }


  @override
  void dispose() {
    _routeChangeData.close();
  }
}
