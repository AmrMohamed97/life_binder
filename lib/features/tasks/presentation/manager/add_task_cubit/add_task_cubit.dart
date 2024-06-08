import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utiles/cache_helper.dart';
import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/features/tasks/data/model/task_model.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  late int notificationId ;
  Future<int> assignNotificationId() async{
    notificationId = await getIt.get<CacheHelper>().getData(key: 'notificationId');
    return notificationId;
  }
 
  Future<void> addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      tasks.add({
        'startDate': task.startDate,
        'startTime': task.startTime,
        'endTime': task.endTime,
        'endDate': task.endDate,
        'taskName': task.taskName,
        'taskContent': task.taskContent,
        'isDone': task.isDone,
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'notificationId1': await assignNotificationId(),
        'notificationId2': await assignNotificationId()+1,
      });
      emit(AddTaskSuccess());
    } catch (error) {
      debugPrint(
          '$error..........................................................');
      emit(AddTaskError(error: error));
    }
  }
}
