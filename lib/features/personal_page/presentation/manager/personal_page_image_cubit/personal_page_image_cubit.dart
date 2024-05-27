import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_image_cubit/personal_page_image_state.dart';

class PersonalPageImageCubit extends Cubit<PersonalPageImageStates> {
  PersonalPageImageCubit() : super(PersonalPageImageInitialState());
}