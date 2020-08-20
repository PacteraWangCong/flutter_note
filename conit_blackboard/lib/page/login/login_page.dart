import 'package:conitblackboard/config/config_index.dart';
import 'package:conitblackboard/utils/units_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('login'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CupertinoTextField(),
              SizedBox(height: 30),
              CupertinoTextField(),
              SizedBox(height: 30),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'login',
                        style: TextStyles.customBold(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  consolePrint('login');
                  Navigator.of(context).pushNamed(Routes.login);
                },
              ),
              SizedBox(height: 20),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  height: 50,
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'register',
                        style: TextStyles.customBold(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  consolePrint('login');
                  Navigator.of(context).pushNamed(Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
