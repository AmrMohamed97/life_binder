abstract class DeleteTaskState {}

class DeleteTaskInitialState extends DeleteTaskState {}

class DeleteTaskLoadState extends DeleteTaskState {}
class DeleteTaskSuccessState extends DeleteTaskState {}
class DeleteTaskErrorState extends DeleteTaskState {
  final dynamic error;
  DeleteTaskErrorState({required this.error});
}