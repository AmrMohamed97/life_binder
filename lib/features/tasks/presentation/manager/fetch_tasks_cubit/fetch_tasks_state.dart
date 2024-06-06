abstract class FetchTasksState {}

class FetchTasksInitialState extends FetchTasksState {}

class FetchTasksLoadState extends FetchTasksState {}

class FetchTasksSuccessState extends FetchTasksState {}
class FetchTasksEmptySuccessState extends FetchTasksState {}

class FetchTaskserrorState extends FetchTasksState {
  final dynamic error;

  FetchTaskserrorState({required this.error});
}
