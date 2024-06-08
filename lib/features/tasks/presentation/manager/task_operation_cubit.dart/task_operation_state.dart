abstract class TaskOperationState {}

class TaskOperationInitialState extends TaskOperationState {}

class DeleteTaskLoadState extends TaskOperationState {}

class DeleteTaskSuccessState extends TaskOperationState {}

class DeleteTaskErrorState extends TaskOperationState {
  final dynamic error;
  DeleteTaskErrorState({required this.error});
}

class ChangeTaskStateLoadingState extends TaskOperationState {}

class ChangeTaskStateSuccessState extends TaskOperationState {}

class ChangeTaskStateErrorState extends TaskOperationState {
  final dynamic error;
  ChangeTaskStateErrorState({required this.error});
}
