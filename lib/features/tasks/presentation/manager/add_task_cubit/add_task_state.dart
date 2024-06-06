abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}
class AddTaskSuccess extends AddTaskState {}
class AddTaskError extends AddTaskState {
  final  dynamic error;

  AddTaskError({required this.error});
}