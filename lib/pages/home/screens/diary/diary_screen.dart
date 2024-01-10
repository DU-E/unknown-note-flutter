import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_event.dart';
import 'package:unknown_note_flutter/bloc/diary/diary_list_state.dart';
import 'package:unknown_note_flutter/common/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/common/widgets/common_loading_widget.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_diary_category.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_appbar.dart';
import 'package:unknown_note_flutter/pages/home/screens/diary/widgets/diary_listitem_widget.dart';

class DiaryScreen extends StatefulWidget {
  final SlidingUpPanelController slidingController;

  const DiaryScreen({
    super.key,
    required this.slidingController,
  });

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  void initState() {
    super.initState();

    final bloc = context.read<DiaryListBloc>();
    if (bloc.state.list.isEmpty) {
      bloc.add(DiaryListChangeCategory(category: EDiaryCategory.recomm));
    }
  }

  void _loadMore() {
    context.read<DiaryListBloc>().add(DiaryListLoadMore());
  }

  void _onTapCategory() {
    widget.slidingController.collapse();
  }

  void _onTapAdd() {
    context.push('/write/diary');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BlocBuilder<DiaryListBloc, DiaryListState>(
          builder: (context, state) => ListView.separated(
            padding: EdgeInsets.only(
              bottom: Sizes.size96 + MediaQuery.of(context).padding.bottom,
              top: Sizes.size72,
              left: Sizes.size20,
              right: Sizes.size20,
            ),
            itemBuilder: (context, index) {
              if (index < state.list.length) {
                return DiaryListItemWidget(
                  diary: state.list[index],
                );
              } else {
                return CommonLoadingWidget(whenBuild: _loadMore);
              }
            },
            separatorBuilder: (context, index) => Gaps.v20,
            itemCount: state.list.length + 1,
          ),
        ),
        const DiaryAppBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              left: Sizes.size28,
              right: Sizes.size28,
              bottom: MediaQuery.of(context).padding.bottom + Sizes.size20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonIconButton(
                  icon: Icons.category_rounded,
                  onTap: _onTapCategory,
                ),
                CommonIconButton(
                  icon: Icons.add_rounded,
                  onTap: _onTapAdd,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
