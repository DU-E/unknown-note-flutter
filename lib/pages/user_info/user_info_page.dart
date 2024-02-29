import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_bloc.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_event.dart';
import 'package:unknown_note_flutter/bloc/user_info/user_info_state.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/constants/strings.dart';
import 'package:unknown_note_flutter/enums/enum_emotion.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/models/user/user_model.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';
import 'package:unknown_note_flutter/pages/essay/widgets/essay_listitem_widget.dart';
import 'package:unknown_note_flutter/pages/user_info/widgets/user_info_flower.dart';
import 'package:unknown_note_flutter/pages/user_info/widgets/user_info_graph.dart';
import 'package:unknown_note_flutter/pages/user_info/widgets/user_info_heatmap.dart';
import 'package:unknown_note_flutter/pages/user_info/widgets/user_info_profile_widget.dart';
import 'package:unknown_note_flutter/pages/user_info/widgets/user_info_statics.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_blur_container.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';

class UserInfoPage extends StatefulWidget {
  final bool popAble;
  final int userId;
  final String? nickName;

  const UserInfoPage({
    super.key,
    this.popAble = false,
    required this.userId,
    this.nickName,
  });

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>
    with SingleTickerProviderStateMixin {
  static const double _expandedHeight = 250;
  static const double _appbarHeight = Sizes.size52;
  late final ScrollController _scrollController;
  late final TabController _tabController;
  late final PageController _pageController;
  final ValueNotifier<double> _titleBottomPadding = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(
      length: widget.popAble ? 2 : 4,
      vsync: this,
    );
    _tabController.addListener(_tabListener);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _tabController.removeListener(_tabListener);
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    const ratio = 0.3;
    if (_expandedHeight - _appbarHeight * ratio > _scrollController.offset) {
      _titleBottomPadding.value = 0;
    }
    if (_expandedHeight - _appbarHeight * ratio <= _scrollController.offset &&
        _expandedHeight + _appbarHeight * (1 - ratio) >=
            _scrollController.offset) {
      _titleBottomPadding.value =
          _scrollController.offset - _expandedHeight + _appbarHeight * ratio;
    }
    if (_expandedHeight + _appbarHeight * (1 - ratio) <
        _scrollController.offset) {
      _titleBottomPadding.value = _appbarHeight;
    }
  }

  void _tabListener() {
    _pageController.animateToPage(
      _tabController.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: ValueListenableBuilder(
            valueListenable: _titleBottomPadding,
            builder: (context, value, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 1),
              margin: EdgeInsets.only(
                bottom: value * 2,
                top: _appbarHeight,
              ),
              child: child,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: _appbarHeight,
                  child: Center(
                    child: AppFont(
                      widget.popAble ? '작성자 정보' : '내 정보',
                      color: Colors.white,
                      size: Sizes.size16,
                      weight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: _appbarHeight,
                  child: Center(
                    child: AppFont(
                      widget.nickName ??
                          state.userProfile?.user?.nickName ??
                          Strings.nullStr,
                      color: Colors.white,
                      size: Sizes.size16,
                      weight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          leading: widget.popAble ? null : const SizedBox(),
          actions: [
            Container(
              width: Sizes.size56,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size5,
              ),
              child: !widget.popAble
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_rounded,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        body: Stack(
          children: [
            _buildBody(state),
            if (state.status == ELoadingStatus.error)
              _buildError(state.message),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(UserInfoState state) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: _expandedHeight,
            child: UserInfoProfileWidget(
              nickName: widget.nickName,
              user: state.userProfile?.user ?? UserModel(),
              diaryCount: state.userProfile?.diaryCount ?? 0,
              essayCount: state.userProfile?.essayCount ?? 0,
              status: state.status,
            ),
          ),
        ),
        SliverStickyHeader(
          header: CommonBlurContainer(
            child: TabBar(
              controller: _tabController,
              dividerColor: Theme.of(context).primaryColor,
              indicatorColor: Colors.white,
              tabs: [
                if (!widget.popAble)
                  const Tab(
                    child: AppFont(
                      '감정 분석',
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                  ),
                const Tab(
                  child: AppFont(
                    '활동 기록',
                    color: Colors.white,
                    weight: FontWeight.w700,
                  ),
                ),
                if (!widget.popAble)
                  const Tab(
                    child: AppFont(
                      '기분 통계',
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                  ),
                const Tab(
                  child: AppFont(
                    '이달의 꽃',
                    color: Colors.white,
                    weight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          sliver: SliverToBoxAdapter(
            child: ExpandablePageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              animationCurve: Curves.easeOut,
              children: [
                if (!widget.popAble)
                  UserInfoGraph(
                    graphData: state.userProfile?.recentGraph ?? [],
                    status: state.status,
                  ),
                UserInfoHeatmap(
                  monthlyData: state.userProfile?.monthlyAct ?? [],
                ),
                if (!widget.popAble)
                  UserInfoStatics(
                    emotionsData: state.userProfile?.monthlyEmotions ??
                        UserMonthlyEmotionModel(),
                  ),
                UserInfoFlower(
                  flower: state.userProfile?.flower ?? EEmotion.happy,
                  status: state.status,
                ),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: const CommonBlurContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppFont(
                    '작성한 수필',
                    color: Colors.white,
                    weight: FontWeight.w700,
                    size: Sizes.size16,
                  ),
                  AppFont(
                    'Total 3',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          sliver: SliverList.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size20,
                left: Sizes.size20,
                right: Sizes.size20,
              ),
              child: EssayListItemWidget(
                essay: EssayModel(),
              ),
            ),
            itemCount: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).padding.bottom + Sizes.size80,
          ),
        ),
      ],
    );
  }

  Widget _buildError(String? message) {
    return CommonBlurContainer(
      height: double.infinity,
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppFont(
              message ?? Strings.unknownFail,
              color: Colors.white,
            ),
            Gaps.v20,
            CommonButton(
              onTap: () {
                context.read<UserInfoBloc>().add(UserInfoGet(widget.userId));
              },
              child: const AppFont('재시도'),
            ),
          ],
        ),
      ),
    );
  }
}
