import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/tasks/presentation/manager/add_task_cubit/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  DateTime? startDate;
  DateTime? endDate;
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
}
