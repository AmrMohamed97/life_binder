abstract class FetchDoneTasksState {}

class FetchDoneTasksInitialState extends FetchDoneTasksState {}

class FetchDoneTasksLoadState extends FetchDoneTasksState {}

class FetchDoneTasksSuccessState extends FetchDoneTasksState {}
class FetchDoneTasksEmptySuccessState extends FetchDoneTasksState {}

class FetchDoneTaskserrorState extends FetchDoneTasksState {
  final dynamic error;

  FetchDoneTaskserrorState({required this.error});
}
