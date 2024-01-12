import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_bloc.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_event.dart';
import 'package:unknown_note_flutter/bloc/setting/setting_state.dart';
import 'package:unknown_note_flutter/common/widgets/app_font.dart';
import 'package:unknown_note_flutter/common/widgets/common_radio_button.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/enums/enum_font.dart';

class CommonFontController extends StatelessWidget {
  const CommonFontController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.font_download_rounded,
                color: Colors.white,
                size: Sizes.size28,
              ),
              Gaps.h5,
              AppFont(
                '폰트를 선택해주세요.',
                color: Colors.white,
                size: Sizes.size16,
                weight: FontWeight.w700,
              ),
            ],
          ),
          Gaps.v10,
          CommonRadioButton(
            title: '프리탠다드 (기본)',
            font: EFont.pretendard,
            isSelected: state.font == EFont.pretendard || state.font == null,
            onTap: () {
              context.read<SettingBloc>().add(SettingFont(EFont.pretendard));
            },
          ),
          CommonRadioButton(
            title: '카페 24 동동',
            font: EFont.cafe24Dongdong,
            isSelected: state.font == EFont.cafe24Dongdong,
            onTap: () {
              context
                  .read<SettingBloc>()
                  .add(SettingFont(EFont.cafe24Dongdong));
            },
          ),
          CommonRadioButton(
            title: '큐트',
            font: EFont.cuteFont,
            isSelected: state.font == EFont.cuteFont,
            onTap: () {
              context.read<SettingBloc>().add(SettingFont(EFont.cuteFont));
            },
          ),
          CommonRadioButton(
            title: '나눔명조',
            font: EFont.nanumMyeongjo,
            isSelected: state.font == EFont.nanumMyeongjo,
            onTap: () {
              context.read<SettingBloc>().add(SettingFont(EFont.nanumMyeongjo));
            },
          ),
          CommonRadioButton(
            title: '푸어 스토리',
            font: EFont.poorStory,
            isSelected: state.font == EFont.poorStory,
            onTap: () {
              context.read<SettingBloc>().add(SettingFont(EFont.poorStory));
            },
          ),
        ],
      ),
    );
  }
}
