import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_bloc.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_event.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_state.dart';

class UserInfoSubButton extends StatelessWidget {
  final int userId;

  const UserInfoSubButton({
    super.key,
    required this.userId,
  });

  void _onTap(BuildContext context) {
    context.read<UserInfoBloc>().add(UserInfoTapSubs(userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) => IconButton(
        onPressed: () => _onTap(context),
        icon: Icon(state.userProfile?.isSubscribed == true
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded),
      ),
    );
  }
}
