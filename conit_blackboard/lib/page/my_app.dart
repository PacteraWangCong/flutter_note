import 'dart:io';
import 'package:conitblackboard/page/blackboard/blackboard_page.dart';
import 'package:conitblackboard/page/login/login_page.dart';
import 'package:conitblackboard/page/task/task_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:conitblackboard/blocs/blocs_index.dart';
import 'package:conitblackboard/config/config_index.dart';
import 'package:conitblackboard/utils/units_index.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppBloc appBloc;
  @override
  void initState() {
    super.initState();
    appBloc = BlocProvider.of<AppBloc>(context);
    OrientationHelper.forceOrientation(DeviceOrientation.portraitUp);
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return StreamBuilder(
      stream: appBloc.errorStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          /// 发生crash 显示自定义画面
          return Container(color: Colors.red);
        } else {
          return MaterialApp(
            title: 'blackboard',
            debugShowCheckedModeBanner: false,
            // 设置全局context，用于最外层弹出popAlert和loading
            navigatorKey: navigatorKey,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: hiraginoSans,
              backgroundColor: Colours.background,
              cupertinoOverrideTheme: CupertinoThemeData(
                barBackgroundColor: Colours.background,
                scaffoldBackgroundColor: Colours.background,
                textTheme: CupertinoTextThemeData(
                  navActionTextStyle: TextStyles.barTitle,
                  navTitleTextStyle: TextStyles.barTitle,
                  textStyle: TextStyles.listContent,
                ),
              ),
            ),
            routes: {
              Routes.tasKList: (context) {
                final bloc = TaskListBloc();
                return BlocProvider(
                  child: TaskListPage(),
                  bloc: bloc,
                );
              },
              Routes.login: (context) {
                final bloc = LoginBloc();
                return BlocProvider(
                  child: LoginPage(),
                  bloc: bloc,
                );
              },
              Routes.blackboard: (context) {
                final bloc = BlackboardBloc();
                return BlocProvider(
                  child: BlackboardPage(),
                  bloc: bloc,
                );
              },
            },
            initialRoute: Routes.tasKList,
            builder: (ctx, w) {
              // 禁止字体大小随系统变换
              return MaxScaleTextWidget(
                child: w,
              );
            },
            navigatorObservers: [
              MyObserver(appBloc),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('ja', 'JP'),
            ],
          );
        }
      },
    );
  }
}

/// 监听路由发生变化
class MyObserver extends NavigatorObserver {
  final AppBloc appBloc;

  MyObserver(this.appBloc);

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if (route is MaterialPageRoute) {
      appBloc.routeChange(RouteChangeType.push);
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (route is MaterialPageRoute) {
      appBloc.routeChange(RouteChangeType.pop);
    }
  }
}

/// 禁止字体大小随系统变换
class MaxScaleTextWidget extends StatelessWidget {
  final Widget child;

  const MaxScaleTextWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1),
      child: child,
    );
  }
}
