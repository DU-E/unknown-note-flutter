import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown_note_flutter/widgets/common_radio_button.dart';

class WriteDiarySlideResetButton extends StatefulWidget {
  final Function() onDelete;

  const WriteDiarySlideResetButton({
    super.key,
    required this.onDelete,
  });

  @override
  State<WriteDiarySlideResetButton> createState() =>
      _WriteDiarySlideResetButtonState();
}

class _WriteDiarySlideResetButtonState
    extends State<WriteDiarySlideResetButton> {
  bool _isConfirmed = false;

  void _onTap() {
    if (!_isConfirmed) {
      setState(() {
        _isConfirmed = true;
      });
    } else {
      widget.onDelete();
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonRadioButton(
      onTap: _onTap,
      color: Colors.red.withOpacity(0.5),
      icon: Icons.delete_rounded,
      title: _isConfirmed ? '모든 내용을 지우시겠습니까?' : '초기화',
    );
  }
}
