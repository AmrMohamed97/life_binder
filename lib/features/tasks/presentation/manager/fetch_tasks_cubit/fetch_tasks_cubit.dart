import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/fetch_tasks_cubit/fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  FetchTasksCubit() : super(FetchTasksInitialState());
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  List<TaskModel> tasksList = [];
  Future<void> fetchTasks() async {
    emit(FetchTasksLoadState());
    try {
      await tasks
          // .where('UserId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .where('isDone', isEqualTo: false)
          .orderBy('startDate', descending: true)
          .get()
          .then((value) {
        for (var element in value.docs) {
          tasksList.add(TaskModel.fromJson(element));
        }
      });
      emit(FetchTasksSuccessState());
    } catch (error) {
      print('===================================================');
      print(error);
      emit(FetchTaskserrorState(error: error));
    }
  }
}
