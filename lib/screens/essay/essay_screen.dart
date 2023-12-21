import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/common/widgets/loading_widget.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/screens/essay/widgets/essay_listitem_widget.dart';

class EssayScreen extends StatefulWidget {
  const EssayScreen({super.key});

  @override
  State<EssayScreen> createState() => _EssayScreenState();
}

class _EssayScreenState extends State<EssayScreen> {
  @override
  void initState() {
    super.initState();

    final bloc = context.read<EssayListBloc>();
    if (bloc.state.list.isEmpty) {
      bloc.add(EssayListChangeCategory(category: EEssayCategory.recomm));
    }
  }

  void _loadMore() {
    context.read<EssayListBloc>().add(EssayListLoadMore());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EssayListBloc, EssayListState>(
        builder: (context, state) => ListView.separated(
          itemBuilder: (context, index) {
            if (index < state.list.length) {
              return EssayListItemWidget(
                essay: state.list[index],
              );
            } else {
              return LoadingWidget(whenBuild: _loadMore);
            }
          },
          separatorBuilder: (context, index) => Gaps.v10,
          itemCount: state.list.length + 1,
        ),
      ),
    );
  }
}
