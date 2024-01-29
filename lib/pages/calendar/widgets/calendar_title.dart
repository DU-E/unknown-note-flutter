import 'package:flutter/material.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';
import 'package:unknown_note_flutter/widgets/common_button.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class CalendarTitle extends StatelessWidget {
  final DateTime date;
  final Function() gotoToday;

  const CalendarTitle({
    super.key,
    required this.date,
    required this.gotoToday,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: Sizes.size40,
          ),
          Column(
            children: [
              AppFont(date.year.toString()),
              AppFont(
                date.month.toString().padLeft(2, '0'),
                size: Sizes.size20,
                color: Theme.of(context).primaryColor,
                weight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(
            width: Sizes.size40,
            child: CommonButton(
              onTap: gotoToday,
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              shadowColor: Colors.transparent,
              child: Column(
                children: [
                  AppFont(
                    DateTime.now().month.toString(),
                    size: Sizes.size8,
                  ),
                  AppFont(
                    DateTime.now().day.toString(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
