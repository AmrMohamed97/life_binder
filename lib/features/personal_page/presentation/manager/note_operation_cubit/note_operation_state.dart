abstract class NoteOperationState {}

class NoteOperationInitial extends NoteOperationState {}

class GetUserNotesLoadingState extends NoteOperationState{}
class GetUserNotesSuccessState extends NoteOperationState{}
class GetUserNotesErrorState extends NoteOperationState{}
class GetUserNotesSuccessWithNoDataState extends NoteOperationState{}

 class DeleteItemLoadingState extends NoteOperationState{}
class DeleteItemSuccessState extends NoteOperationState{}
class DeleteItemErrorState extends NoteOperationState{
  DeleteItemErrorState({required this.error});
  final dynamic error;
}
