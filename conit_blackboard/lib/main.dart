import 'dart:async';
import 'package:conitblackboard/widgets/mf_loading.dart';
import 'package:flutter/material.dart';
import 'package:conitblackboard/blocs/blocs_index.dart';
import 'package:conitblackboard/page/my_app.dart';
import 'package:conitblackboard/utils/units_index.dart';
import 'package:load/load.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appBloc = AppBloc();
  runZoned(
        () {
      runApp(
        LoadingProvider(
          themeData: LoadingThemeData(tapDismiss: false, animDuration: Duration.zero),
          loadingWidgetBuilder: (ctx, data) {
            return MFLoading();
          },
          child: BlocProvider(
            child: MyApp(),
            bloc: appBloc,
          ),
        ),
      );
    },
    onError: (dynamic exception, StackTrace stack, {dynamic context}) async {
      consolePrint('exception is --$exception\n stack is ---$stack');
      appBloc.changeErrorData(true);
    },
  );
}