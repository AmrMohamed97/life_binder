import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utiles/cache_helper.dart';
import 'package:note_app/core/utiles/functions/set_up.dart';
import 'package:note_app/features/auth/presentation/manager/app_theme_cubit/app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitialState());
  bool isDark = getIt.get<CacheHelper>().getData(key: 'theme') ?? false;
  Future<void> changeTheme() async {
    isDark = !isDark;
    await getIt.get<CacheHelper>().saveData(key: 'theme', value: isDark);
    emit(ChangeThemeState());
  }
}
