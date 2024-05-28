import 'package:flutter/material.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    super.key, required this.cubit,
  });
  final PersonInfoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return cubit.userName == null
        ? const Text(' ')
        : Text(
            '${cubit.userName}',
            style: const TextStyle(color: Colors.black, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
  }
}
