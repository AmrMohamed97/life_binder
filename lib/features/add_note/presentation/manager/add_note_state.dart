abstract class AddNoteState{}
class AddNoteInitialState extends AddNoteState{}
class AddImageErrorState extends AddNoteState{}
class AddImageSuccessState extends AddNoteState{}
class NoteUploadLoading extends AddNoteState{}
class NoteUploadedSuccess extends AddNoteState{}
class NoteUploadError extends AddNoteState{}