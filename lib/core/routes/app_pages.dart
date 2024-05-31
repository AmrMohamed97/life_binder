
import 'package:flutter/material.dart';
import 'package:note_app/features/add_note/presentation/pages/add_notes.dart';
import 'package:note_app/features/auth/presentation/pages/login/login_view.dart';
import 'package:note_app/features/auth/presentation/pages/register/register_view.dart';
 import 'package:note_app/features/personal_page/presentation/pages/personal_page_view.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/core/widgets/no_data_widget.dart';

class AppPages{
  AppPages._();
  static Map<String, Widget Function(BuildContext)> routes={
    PagesKeys.loginView:(context)=>const LoginView(),
    PagesKeys.registerView:(context)=>const RegisterView(),
    PagesKeys.testView:(context)=>const NoDataWidget(),
    PagesKeys.addNotes:(context)=>const AddNotes(),
    // PagesKeys.searchView:(context)=>const SearchView(),
    PagesKeys.personalPageView:(context)=>const PersonalPageView(),
   };
}