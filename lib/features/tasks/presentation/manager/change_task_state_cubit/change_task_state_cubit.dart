import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/change_task_state_cubit/change_task_state_state.dart';

class ChangeTaskStateCubit extends Cubit<ChangeTaskStateState> {
  ChangeTaskStateCubit() : super(ChangeTaskStateInitialState());
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  Future<void> changeTaskState({required String id}) async {
    tasks.doc(id).update({'isDone': true});
    emit(ChangeTaskStateLoadingState());
    try {
      emit(ChangeTaskStateSuccessState());
    } catch (error) {
      print('===================================================');
      print(error);
      emit(ChangeTaskStateErrorState(error: error));
    }
  }
}