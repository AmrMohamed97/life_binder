import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/fetch_done_tasks_cubit/fetch_done_task_state.dart';
 
class FetchDoneTasksCubit extends Cubit<FetchDoneTasksState> {
  FetchDoneTasksCubit() : super(FetchDoneTasksInitialState());
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  List<TaskModel> doneTasksList = [];
  Future<void> fetchDoneTasks() async {
    emit(FetchDoneTasksLoadState());
    try {
      tasks
          // .where('UserId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .where('isDone', isEqualTo: true)
          .orderBy('startDate', descending: true)
          .snapshots()
          .listen((value) {
        if (value.docs.isNotEmpty) {
          doneTasksList = [];
  for (var element in value.docs) {
    doneTasksList.add(TaskModel.fromJson(element));
  }
emit(FetchDoneTasksSuccessState());
}else{
  doneTasksList = [];
  emit(FetchDoneTasksEmptySuccessState());
}
      });
      
    } catch (error) {
      print('===================================================');
      print(error);
      emit(FetchDoneTaskserrorState(error: error));
    }
  }
}
