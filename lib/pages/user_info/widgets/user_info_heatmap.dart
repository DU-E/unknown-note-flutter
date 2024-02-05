import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class UserInfoHeatmap extends StatelessWidget {
  const UserInfoHeatmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            Gaps.h20,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
              child: HeatMap(
                datasets: {
                  DateTime(2024, 1, 17): 3,
                  DateTime(2024, 1, 16): 6,
                  DateTime(2024, 1, 14): 1,
                  DateTime(2024, 1, 13): 2,
                },
                colorMode: ColorMode.opacity,
                showColorTip: false,
                scrollable: true,
                colorsets: {
                  0: Theme.of(context).primaryColor,
                },
                startDate: DateTime(
                  DateTime.now().year,
                  DateTime.now().month - 3,
                  DateTime.now().day,
                ),
              ),
            ),
            Gaps.h20,
          ],
        ),
      ),
    );
  }
}
