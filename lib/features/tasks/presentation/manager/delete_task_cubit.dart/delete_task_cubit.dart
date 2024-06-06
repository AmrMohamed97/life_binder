import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:note_app/features/tasks/presentation/manager/delete_task_cubit.dart/delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitialState());
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  Future<void> deleteTask({required String id}) async {
    tasks.doc(id).delete();
    emit(DeleteTaskLoadState());
    try {
      emit(DeleteTaskSuccessState());
    } catch (error) {
      print('===================================================');
      print(error);
      emit(DeleteTaskErrorState(error: error));
    }
  }
}