import 'package:conitblackboard/blocs/blocs_index.dart';
import 'package:conitblackboard/models/req/req_task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conitblackboard/config/config_index.dart';

/// 案件一览
class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  TaskListBloc _taskListBloc;

  @override
  void initState() {
    _taskListBloc = BlocProvider.of<TaskListBloc>(context);
    _taskListBloc.loadDataApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('案件一览'),
      ),
      body: StreamBuilder(
        stream: _taskListBloc.taskData.stream,
        builder: (BuildContext context, AsyncSnapshot<List<ReqTaskModel>> snapshot) {
          final result = snapshot.data;
          return SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: result?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          alignment: Alignment.center,
                          child: Text(result[index].title),
                        );
                      }),
                ),
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
                    Navigator.of(context).pushNamed(Routes.login);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
