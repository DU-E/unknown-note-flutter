import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:unknown_note_flutter/constants/gaps.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/models/user/user_profile_model.dart';

class UserInfoHeatmap extends StatelessWidget {
  final List<UserStatsDataModel> monthlyData;

  const UserInfoHeatmap({
    super.key,
    required this.monthlyData,
  });

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

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
                  for (var data in monthlyData)
                    (data.date ?? today): data.value?.toInt() ?? 0,
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
