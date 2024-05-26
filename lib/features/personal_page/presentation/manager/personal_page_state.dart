abstract class PersonalPageState{}
class PersonalPageInitialState extends PersonalPageState{}
class AddPersonalOrBackgroundImageSuccess extends PersonalPageState{}
class AddPersonalOrBackgroundImageError extends PersonalPageState{}

class ImageDeleteLoading extends PersonalPageState{}
class ImageDeletedSuccess extends PersonalPageState{}
class ImageDeletedError extends PersonalPageState{}

class ChangeLoadState extends PersonalPageState{}

class GetPersonalImageLoadingState extends PersonalPageState{}
class GetPersonalImageSuccessState extends PersonalPageState{}
class GetPersonalImageSuccessWithoutData extends PersonalPageState{}
class GetPersonalImageErrorState extends PersonalPageState{}

class GetBackgroundImageLoadingState extends PersonalPageState{}
class GetBackgroundImageSuccessState extends PersonalPageState{}
class GetBackgroundImageSuccessWithoutData extends PersonalPageState{}
class GetBackgroundImageErrorState extends PersonalPageState{}

class GetUserNameSuccessState extends PersonalPageState{}
class GetUserNameSuccessWithoutData extends PersonalPageState{}
class GetUserNameErrorState extends PersonalPageState{}
 
class DeleteItemLoadingState extends PersonalPageState{}
class DeleteItemSuccessState extends PersonalPageState{}
class DeleteItemErrorState extends PersonalPageState{
  DeleteItemErrorState({required this.error});
  final dynamic error;
}
class GetUserNotesLoadingState extends PersonalPageState{}
class GetUserNotesSuccessState extends PersonalPageState{}
class GetUserNotesErrorState extends PersonalPageState{}
class GetUserNotesSuccessWithNoDataState extends PersonalPageState{}

 
