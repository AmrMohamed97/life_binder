abstract class DeleteListItemStates {}

class DeleteItemInitialState extends DeleteListItemStates{}
class DeleteItemLoadingState extends DeleteListItemStates{}
class DeleteItemSuccessState extends DeleteListItemStates{}
class DeleteItemErrorState extends DeleteListItemStates{
  DeleteItemErrorState({required this.error});
  final dynamic error;
}
