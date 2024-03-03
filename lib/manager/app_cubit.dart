import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/manager/app_state.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit():super(AppInitialState());
}