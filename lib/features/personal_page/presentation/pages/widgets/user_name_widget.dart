import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/get_user_name_cubit.dart';
import 'package:note_app/features/personal_page/presentation/manager/personal_page_cubit/get_user_name_state.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserNameCubit, GetUserNameState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<GetUserNameCubit>(context);
          return cubit.userName == null
        ? const Text(' ')
        :   Text(
            '${cubit.userName}',
            style: const TextStyle(color: Colors.black, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        });
    
  }
}
