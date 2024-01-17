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
          Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size40,
              bottom: Sizes.size20,
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(Sizes.size20),
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
                        isCurved: true,
                        curveSmoothness: 0.2,
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Theme.of(context).primaryColor,
                          ],
                        ),
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey,
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
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size20,
                top: Sizes.size20,
              ),
              child: Container(
                height: 220,
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
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: Sizes.size20,
                bottom: Sizes.size20,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width - Sizes.size80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size20),
                  gradient: LinearGradient(
                    stops: const [0, 1],
                    end: Alignment.centerLeft,
                    begin: Alignment.centerRight,
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.8),
                      Theme.of(context).primaryColor.withOpacity(0.5),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.size2,
                    horizontal: Sizes.size10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppFont(
                        'Last 30 Days',
                        color: Colors.white,
                        weight: FontWeight.w700,
                      ),
                      AppFont(
                        'Today',
                        color: Colors.white,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
