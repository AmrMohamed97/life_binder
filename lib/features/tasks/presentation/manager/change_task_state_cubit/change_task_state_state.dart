abstract class ChangeTaskStateState {}

class ChangeTaskStateInitialState extends ChangeTaskStateState {}

class ChangeTaskStateLoadingState extends ChangeTaskStateState {}
class ChangeTaskStateSuccessState extends ChangeTaskStateState {}
class ChangeTaskStateErrorState extends ChangeTaskStateState {
  final dynamic error;
  ChangeTaskStateErrorState({required this.error});
}