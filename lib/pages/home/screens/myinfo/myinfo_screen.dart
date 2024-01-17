import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/pages/home/screens/essay/widgets/essay_listitem_widget.dart';
import 'package:unknown_note_flutter/pages/home/screens/myinfo/widgets/myinfo_profile_widget.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_blur_container.dart';

class MyinfoScreen extends StatefulWidget {
  const MyinfoScreen({super.key});

  @override
  State<MyinfoScreen> createState() => _MyinfoScreenState();
}

class _MyinfoScreenState extends State<MyinfoScreen>
    with SingleTickerProviderStateMixin {
  static const double _expandedHeight = 250;
  static const double _appbarHeight = Sizes.size52;
  late final ScrollController _scrollController;
  late final TabController _tabController;
  final ValueNotifier<double> _titleBottomPadding = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _tabController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
        surfaceTintColor: Colors.transparent,
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
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: _appbarHeight,
                child: Center(
                  child: AppFont(
                    '내 정보',
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
                    'username',
                    color: Colors.white,
                    size: Sizes.size16,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: const SizedBox(),
        actions: [
          Container(
            width: Sizes.size56,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size5,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: _expandedHeight,
              child: MyInfoProfileWidget(),
            ),
          ),
          SliverStickyHeader(
            header: CommonBlurContainer(
              child: TabBar(
                controller: _tabController,
                dividerColor: Theme.of(context).primaryColor,
                indicatorColor: Colors.white,
                tabs: const [
                  Tab(
                    child: AppFont(
                      '감정 분석',
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                  ),
                  Tab(
                    child: AppFont(
                      '활동 기록',
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                  ),
                  Tab(
                    child: AppFont(
                      '기분 통계',
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                  ),
                  Tab(
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
              child: Container(
                height: 200,
                color: Colors.white,
                child: const Center(
                  child: AppFont('graphs'),
                ),
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
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(
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
      ),
    );
  }
}
