import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_bloc.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_event.dart';
import 'package:unknown_note_flutter/bloc/essay/essay_list_state.dart';
import 'package:unknown_note_flutter/common/widgets/common_icon_button.dart';
import 'package:unknown_note_flutter/common/widgets/common_loading_widget.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/pages/home/screens/essay/widgets/essay_appbar.dart';
import 'package:unknown_note_flutter/pages/home/screens/essay/widgets/essay_listitem_widget.dart';

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

  void _onTapCategory() {
    DraggableMenu.open(
      context,
      DraggableMenu(
        customUi: Container(color: Colors.red),
        child: const SizedBox(),
      ),
    );
  }

  void _onTapAdd() {
    context.push('/write/essay');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BlocBuilder<EssayListBloc, EssayListState>(
          builder: (context, state) => ListView.separated(
            padding: EdgeInsets.only(
              bottom: Sizes.size96 + MediaQuery.of(context).padding.bottom,
              top: Sizes.size72,
              left: Sizes.size20,
              right: Sizes.size20,
            ),
            itemBuilder: (context, index) {
              if (index < state.list.length) {
                return EssayListItemWidget(
                  essay: state.list[index],
                );
              } else {
                return CommonLoadingWidget(whenBuild: _loadMore);
              }
            },
            separatorBuilder: (context, index) => Gaps.v20,
            itemCount: state.list.length + 1,
          ),
        ),
        const EssayAppBar(),
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
