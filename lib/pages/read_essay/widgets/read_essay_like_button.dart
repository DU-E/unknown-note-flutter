import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_like_cubit.dart';

class ReadEssayLikeButton extends StatelessWidget {
  const ReadEssayLikeButton({super.key});

  void _onTap(BuildContext context) {
    context.read<EssayLikeCubit>().tapLike();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EssayLikeCubit, EssayLikeState>(
      builder: (context, state) => IconButton(
        onPressed: () => _onTap(context),
        icon: Icon(state.isLike == true
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded),
      ),
    );
  }
}
