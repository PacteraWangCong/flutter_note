import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:load/src/dismiss_future.dart';

class MFLoading extends Dialog {
  final String message;
  final TextStyle messageStyle;
  final Color color;

  MFLoading({
    Key key,
    this.message = '',
    this.messageStyle,
    this.color = Colors.white,
  }) : super(key: key);

  static show() {
    if (FutureManager.getInstance().futures.length == 0) {
      showLoadingDialog();
    }
  }

  static dismiss() {
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      if (FutureManager.getInstance().futures.length != 0) {
        hideLoadingDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _messageStyle = messageStyle ?? TextStyle(color: color, decoration: TextDecoration.none, fontSize: 18);
    return WillPopScope(
      child: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
              message.isNotEmpty
                  ? Column(
                      children: <Widget>[
                        SizedBox(
                          height: 25,
                        ),
                        Text(message, style: _messageStyle)
                      ],
                    )
                  : SizedBox()
            ],
          ),
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onWillPop: () {
        return;
      },
    );
  }
}
