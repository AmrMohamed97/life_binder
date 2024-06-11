import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/task_operation_cubit.dart/task_operation_state.dart';

class TaskOperationCubit extends Cubit<TaskOperationState> {
  TaskOperationCubit() : super(TaskOperationInitialState());
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  Future<void> deleteTask({required String id}) async {
    tasks.doc(id).delete();
    emit(DeleteTaskLoadState());
    try {
      emit(DeleteTaskSuccessState());
    } catch (error) {
      debugPrint('===================================================');
      debugPrint(error.toString());
      emit(DeleteTaskErrorState(error: error));
    }
  }

  //----change state------
  Future<void> changeTaskState({required String id}) async {
    tasks.doc(id).update({'isDone': true});
    emit(ChangeTaskStateLoadingState());
    try {
      emit(ChangeTaskStateSuccessState());
    } catch (error) {
      debugPrint('===================================================');
      debugPrint(error.toString());
      emit(ChangeTaskStateErrorState(error: error));
    }
  }
}
