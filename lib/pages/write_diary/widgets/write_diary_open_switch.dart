import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';

class WriteDiaryOpenSwitch extends StatelessWidget {
  final bool value;
  final Function(bool value) onChanged;

  const WriteDiaryOpenSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.size72,
      height: Sizes.size72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppFont(
            value ? '공개' : '비공개',
            color: Theme.of(context).primaryColor,
            weight: FontWeight.w700,
          ),
          Switch(
            activeColor: Colors.green,
            inactiveTrackColor: Colors.red.withOpacity(0.5),
            inactiveThumbColor: Colors.red,
            trackOutlineColor:
                const MaterialStatePropertyAll(Colors.transparent),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
