import 'package:flutter/material.dart';
import 'app_bloc.dart';

typedef RouteChangeCallBack = void Function();

abstract class BlocBase {
  /// 当BlocProvider中userSuperContext为Ture时才有值
  BuildContext superContext;

  /// superContext 是否是当前页面
  bool _isCurrent = false;

  /// 用于防止多次触发didAppear和didDisappear
  bool _lockRouteChange = false;

  void dispose();

  /// 监听route变化
  void listerRouteChange({RouteChangeCallBack didAppearCallBack, RouteChangeCallBack didDisappearCallBack}) {
    ///*如何获取 页面每次显示的方法*///
    final appBloc = BlocProvider.of<AppBloc>(this.superContext);
    if (appBloc == null || superContext == null) {
      return;
    }
    // 监听路由变化
    appBloc.routeChangeStream.listen((value) {
      // context必须在tree中
      if (this.superContext != null && this.superContext.findRenderObject().attached) {
        if (_lockRouteChange) {
          return;
        }
        _lockRouteChange = true;
        Future.delayed(Duration(milliseconds: 200), () {
          _lockRouteChange = false;
        });
        // 获取当前路由信息
        final route = ModalRoute.of(this.superContext);
        if (route.isCurrent) {
          // 当前路由是当前页面，便执行DidAppear方法
          _isCurrent = true;
          if (didAppearCallBack != null) {
            didAppearCallBack();
          }
        } else {
          // 当前路由是不是当前页面，并且_isCurrent == true，便执行DidDisappear方法
          if (_isCurrent) {
            if (didDisappearCallBack != null) {
              didDisappearCallBack();
            }
          }
          _isCurrent = false;
        }
      }
    });
  }
}

/// 将widget和bloc绑定
/// 绑定的bloc在widget子树下都可以使用
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
    this.userDispose: true,
    this.userSuperContext: true,
  }) : super(key: key);

  final T bloc;
  final Widget child;
  final bool userDispose;
  final bool userSuperContext;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    if (widget.userDispose) widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userSuperContext) widget.bloc.superContext = context;
    return widget.child;
  }
}
