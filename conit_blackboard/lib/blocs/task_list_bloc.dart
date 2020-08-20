import 'package:conitblackboard/widgets/mf_loading.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc_provider.dart';
import 'package:conitblackboard/models/req/req_task_model.dart';

class TaskListBloc extends BlocBase {
  BehaviorSubject<List<ReqTaskModel>> taskData = BehaviorSubject<List<ReqTaskModel>>();

  void loadDataApi() {
    /// 模拟使用TaskListApi请求回数据，并映射成model
    MFLoading.show();
    Future.delayed(Duration(seconds: 1), () {
      MFLoading.dismiss();
      List<ReqTaskModel> result = List<ReqTaskModel>();
      for (int i = 0; i < 20; i++) {
        result.add(ReqTaskModel('task $i'));
      }
      taskData.sink.add(result);
    });
  }

  @override
  void dispose() {
    taskData.close();
  }
}
