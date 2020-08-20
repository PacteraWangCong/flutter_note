import 'package:rxdart/rxdart.dart';
import 'bloc_provider.dart';

/// Created by wangcong on 20/03/06

enum RouteChangeType { push, pop, remove, replace, start, tab }

class AppBloc extends BlocBase {
  /// 监听显示的路由变换
  BehaviorSubject<RouteChangeType> _routeChangeData = BehaviorSubject<RouteChangeType>();
  Sink<RouteChangeType> get _routeChangeSink => _routeChangeData.sink;
  Stream<RouteChangeType> get routeChangeStream => _routeChangeData.stream;

  /// 监听crash error
  BehaviorSubject<bool> _errorData = BehaviorSubject<bool>.seeded(false);
  Sink<bool> get _errorSink => _errorData.sink;
  Stream<bool> get errorStream => _errorData.stream;

  void routeChange(RouteChangeType type) {
    _routeChangeSink.add(type);
  }

  void changeErrorData(bool error) {
    _errorSink.add(error);
  }

  @override
  void dispose() {
    _errorData.close();
    _routeChangeData.close();
  }
}
