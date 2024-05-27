abstract class NoteOperationState {}

class NoteOperationInitial extends NoteOperationState {}

class GetUserNotesLoadingState extends NoteOperationState{}
class GetUserNotesSuccessState extends NoteOperationState{}
class GetUserNotesErrorState extends NoteOperationState{}
class GetUserNotesSuccessWithNoDataState extends NoteOperationState{}

 