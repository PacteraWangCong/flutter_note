import 'package:flutter/material.dart';
import 'my_observer.dart';
import 'app_bloc.dart';
import 'bloc_provider.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final appBloc = AppBloc();
  runApp(BlocProvider(
    child: MyApp(),
    bloc: appBloc,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppBloc appBloc;

  @override
  void initState() {
    super.initState();
    appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc demo',
      home: HomePage(),
      navigatorObservers: [
        MyObserver(appBloc),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('example'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('push page1'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  child: Page1(),
                  bloc: Page1Bloc(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



/// page1

class Page1Bloc extends BlocBase {
  @override
  void dispose() {}
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  Page1Bloc _page1bloc;

  @override
  void initState() {
    _page1bloc = BlocProvider.of<Page1Bloc>(context);
    _page1bloc.listerRouteChange(didAppearCallBack: (){
      print("page1----didAppearCallBack");
    }, didDisappearCallBack: () {
      print("page1----didDisappearCallBack");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('page1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('push page2'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  child: Page2(),
                  bloc: Page2Bloc(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


/// page2

class Page2Bloc extends BlocBase {
  @override
  void dispose() {}
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  Page2Bloc _page2bloc;

  @override
  void initState() {
    _page2bloc = BlocProvider.of<Page2Bloc>(context);
    _page2bloc.listerRouteChange(didAppearCallBack: (){
      print("page2----didAppearCallBack");
    }, didDisappearCallBack: () {
      print("page2----didDisappearCallBack");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('page2'),
      ),
      body: Center(
        child: Text('page2'),
      ),
    );
  }
}

