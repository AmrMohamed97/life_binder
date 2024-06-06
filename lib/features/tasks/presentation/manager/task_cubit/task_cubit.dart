import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/task_cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitialState());
  bool isLoading = false;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskContentController = TextEditingController();
  void assignStartTime({required TimeOfDay? time}) {
    startTime = time;
    emit(AssignStartTimeState());
  }

  void assignEndTime({required TimeOfDay? time}) {
    endTime = time;
    emit(AssignEndTimeState());
  }

  void assignEndDate({required DateTime? date}) {
    endDate = date;
    emit(AssignEndDateState());
  }

  void assignStartDate({required DateTime? date}) {
    startDate = date;
    emit(AssignStartDateState());
  }
  void changeLoadingState({required bool state}) {
    isLoading = state;
    emit(ChangeLoadingState());
  }
}
