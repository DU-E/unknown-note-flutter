import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/pages/home/screens/essay/widgets/essay_listitem_widget.dart';
import 'package:unknown_note_flutter/pages/home/screens/myinfo/widgets/myinfo_profile_widget.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';

class MyinfoScreen extends StatefulWidget {
  const MyinfoScreen({super.key});

  @override
  State<MyinfoScreen> createState() => _MyinfoScreenState();
}

class _MyinfoScreenState extends State<MyinfoScreen> {
  static const double _expandedHeight = 250;
  static const double _appbarHeight = Sizes.size52;
  late ScrollController _scrollController;
  final ValueNotifier<double> _titleBottomPadding = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
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
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.only(
              bottom: value * 2,
              top: _appbarHeight,
            ),
            decoration: const BoxDecoration(),
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
        ),
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
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.yellow,
              child: const Center(
                child: AppFont('graphs'),
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => const EssayListItemWidget(
              essay: EssayModel(),
            ),
            itemCount: 20,
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
