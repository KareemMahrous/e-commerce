import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../widget.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const DefaultText('JAN');
      break;
    case 4:
      text = const DefaultText('APR');
      break;
    case 7:
      text = const DefaultText('JUL');
      break;
    case 10:
      text = const DefaultText('OCT');
      break;
    default:
      text = const DefaultText('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  int text;
  switch (value.toInt()) {
    case 5:
      text = 5;
      break;
    case 10:
      text = 10;
      break;
    case 15:
      text = 15;
      break;
    case 20:
      text = 20;
      break;
    case 25:
      text = 25;
      break;
    case 30:
      text = 30;
      break;
    default:
      return Container();
  }

  return DefaultText(text.toString(), textAlign: TextAlign.left);
}

LineChartData mainData(List<OrderEntity> orders) {
  final ordersPerMonth = _getOrdersPerMonth(orders);
  List<Color> gradientColors = [
    AppColors.lightSecondaryColor,
    AppColors.lightSecondaryColor,
  ];
  return LineChartData(
    gridData: const FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 5,
      verticalInterval: 1,
    ),
    titlesData: const FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 5,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: AppColors.lightSecondaryColor, width: 1),
    ),
    minX: 1,
    maxX: 11,
    minY: 0,
    maxY: 30,
    lineBarsData: [
      LineChartBarData(
        spots: _generateOrderSpots(ordersPerMonth),
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ),
    ],
  );
}

LineChartData avgData(List<OrderEntity> orders) {
  final ordersPerMonth = _getOrdersPerMonth(orders);
  const totalMonths = 11;
  List<FlSpot> avgSpots = [];

  for (int month = 1; month <= totalMonths; month++) {
    int ordersCount = ordersPerMonth[month] ?? 0;

    double avgOrders = ordersCount / totalMonths.toDouble();

    avgSpots.add(FlSpot(month.toDouble(), avgOrders));
  }
  List<Color> gradientColors = [
    AppColors.lightSecondaryColor,
    AppColors.lightSecondaryColor,
  ];
  return LineChartData(
    lineTouchData: const LineTouchData(enabled: false),
    gridData: const FlGridData(
      show: true,
      drawHorizontalLine: true,
      verticalInterval: 1,
      horizontalInterval: 5,
    ),
    titlesData: const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: bottomTitleWidgets,
          interval: 1,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
          interval: 1,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: AppColors.lightSecondaryColor, width: 1),
    ),
    minX: 1,
    maxX: 11,
    minY: 0,
    maxY: 10,
    lineBarsData: [
      LineChartBarData(
        spots: avgSpots,
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ),
    ],
  );
}

Map<int, int> _getOrdersPerMonth(List<OrderEntity> orders) {
  Map<int, int> ordersPerMonth = {};

  for (var order in orders) {
    int month = DateTime.parse(order.registered!).month;
    if (ordersPerMonth.containsKey(month)) {
      ordersPerMonth[month] = ordersPerMonth[month]! + 1;
    } else {
      ordersPerMonth[month] = 1;
    }
  }
  return ordersPerMonth;
}

List<FlSpot> _generateOrderSpots(Map<int, int> ordersPerMonth) {
  List<FlSpot> spots = [];

  for (int month = 1; month <= 11; month++) {
    int ordersCount = ordersPerMonth[month] ?? 0;

    ordersCount = ordersCount > 30 ? 30 : ordersCount;
    spots.add(FlSpot(month.toDouble(), ordersCount.toDouble()));
  }

  return spots;
}
