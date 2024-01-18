import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';
import 'package:unknown_note_flutter/widgets/app_font.dart';

class MyInfoGraph extends StatelessWidget {
  const MyInfoGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(
                bottom: Sizes.size12,
                top: Sizes.size20,
                right: Sizes.size52,
              ),
              height: 150,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineTouchData: const LineTouchData(enabled: false),
                  maxX: 30,
                  minX: 0,
                  maxY: 1,
                  minY: 0,
                  lineBarsData: [
                    LineChartBarData(
                      // TODO; set data
                      spots: const [
                        FlSpot(0, -1),
                        FlSpot(2, -0.3),
                        FlSpot(4, 0.3),
                        FlSpot(6, 0.4),
                        FlSpot(12, -0.1),
                        FlSpot(13, 0.2),
                        FlSpot(16, 0.9),
                        FlSpot(22, -0.1),
                        FlSpot(30, 1),
                      ],
                      isStrokeJoinRound: true,
                      isCurved: true,
                      curveSmoothness: 0.2,
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.3),
                          Theme.of(context).primaryColor,
                        ],
                      ),
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                          radius: p3 == 8 ? Sizes.size4 : 0,
                          color: Theme.of(context).primaryColor,
                          strokeWidth: p3 == 8 ? Sizes.size2 : 0,
                          strokeColor:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                        ),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor,
                          ].map((color) => color.withOpacity(0.3)).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: Sizes.size10,
                top: Sizes.size10,
              ),
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size20),
                  gradient: LinearGradient(
                    stops: const [0, 1],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.8),
                      Theme.of(context).primaryColor.withOpacity(0.5),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(Sizes.size2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FontAwesomeIcons.faceSmile,
                        color: Colors.white,
                        size: Sizes.size20,
                      ),
                      Icon(
                        FontAwesomeIcons.faceSadTear,
                        color: Colors.white,
                        size: Sizes.size20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: MediaQuery.of(context).size.width - Sizes.size40,
              height: Sizes.size20,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(Sizes.size20),
                ),
                gradient: LinearGradient(
                  stops: const [0, 1],
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight,
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.8),
                    Theme.of(context).primaryColor.withOpacity(0.6),
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppFont(
                      'Last 30 Days',
                      size: Sizes.size12,
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                    AppFont(
                      'Today',
                      size: Sizes.size12,
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
