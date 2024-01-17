import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:unknown_note_flutter/constants/sizes.dart';

class MyInfoGraph extends StatelessWidget {
  const MyInfoGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Transform.translate(
        offset: const Offset(0, 20),
        child: SingleChildScrollView(
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
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 0,
                maxX: 30,
                minY: 0,
                maxY: 1,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, -1),
                      FlSpot(2.6, -0.3),
                      FlSpot(4.9, 0.3),
                      FlSpot(6.8, 0.4),
                      FlSpot(8, -0.1),
                      FlSpot(9.5, 0.2),
                      FlSpot(11, 0.9),
                      FlSpot(13, -0.1),
                      FlSpot(30, 1),
                    ],
                    isCurved: true,
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
    );
  }
}
