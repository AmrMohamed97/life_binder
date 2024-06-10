import 'package:flutter/material.dart';
import 'package:note_app/features/personal_page/presentation/manager/person_info_cubit/person_info_cubit.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    super.key,
    required this.cubit,
  });
  final PersonInfoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return cubit.userName == null
        ? const Text(' ')
        : FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            child: Text(
              '${cubit.userName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          );
  }
}
