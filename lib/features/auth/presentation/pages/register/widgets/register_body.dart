import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
 import 'package:note_app/features/auth/presentation/manager/auth_state.dart';
import 'package:note_app/core/routes/pages_keys.dart';
import 'package:note_app/features/auth/presentation/manager/register_cubit.dart';
import 'package:note_app/features/auth/presentation/pages/register/widgets/login_row.dart';
import 'package:note_app/features/auth/presentation/pages/register/widgets/register_button.dart';
import 'package:note_app/features/auth/presentation/pages/register/widgets/register_fields.dart';
import 'package:note_app/features/auth/presentation/pages/register/widgets/register_logo.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, AuthState>(
      listener: (context, state) async {
        if (state is RegisterSuccessState) {
          BlocProvider.of<RegisterCubit>(context).isLoading = false;
          Navigator.pushNamed(context, PagesKeys.personalPageView);
          await BlocProvider.of<RegisterCubit>(context).addUser();
        } else if (state is RegisterErrorState) {
          BlocProvider.of<RegisterCubit>(context).isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: cubit.isLoading,
          child: Form(
              key: formKey,
              child: Padding(
                padding:const  EdgeInsets.all(10 * 1.3),
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                             Flexible(child: SizedBox(height: 100,)),
                          RegisterLogo(),
                            Flexible(child: SizedBox(height: 60,)),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          RegisterFields(cubit: cubit),
                          const SizedBox(height: 30,),
                          const LoginRow(),
                          const SizedBox(height: 20,),
                          RegisterButton(formKey: formKey, cubit: cubit),
                          const Expanded(child: SizedBox(height: 20,)),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}