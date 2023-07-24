import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

final List<ChartData> chartData = [
  ChartData('David', 34, const Color.fromRGBO(9, 0, 136, 1)),
  ChartData('Steve', 58, const Color.fromRGBO(147, 0, 119, 1)),
  ChartData('Jack', 28, const Color.fromRGBO(228, 0, 124, 1)),
  ChartData('Others', 80, const Color.fromRGBO(255, 189, 57, 1))
];

class _ChartScreenState extends State<ChartScreen> {
  final List<ChartDataLine> chartDataLine = [
    ChartDataLine(2010, 10, const Color.fromRGBO(9, 0, 136, 1)),
    ChartDataLine(2015, 34, const Color.fromRGBO(255, 189, 57, 1)),
    ChartDataLine(2020, 86, const Color.fromRGBO(147, 0, 119, 1)),
    ChartDataLine(2025, 23, Colors.cyanAccent),
    ChartDataLine(2030, 35, const Color.fromRGBO(228, 0, 124, 1))
  ];
  final List<ChartData1> chartData1 = [
    ChartData1('Jan', -20, 10),
    ChartData1('Feb', -30, 11),
    ChartData1('Mar', -6, 30),
    ChartData1(
      'Apr',
      -18,
      16,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                    dataSource: chartData,
                    name: "Doughnut",
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            SfCircularChart(
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                    dataSource: chartData,
                    name: "Pie-chart",
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            SfCircularChart(series: <CircularSeries>[
              // Renders radial bar chart
              RadialBarSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ]),
            SfCartesianChart(series: <ChartSeries>[
              // Renders line chart
              LineSeries<ChartDataLine, int>(
                  // dashArray: <double>[5, 5], ---for dotted line
                  dataSource: chartDataLine,
                  pointColorMapper: (ChartDataLine data, _) => data.color,
                  xValueMapper: (ChartDataLine data, _) => data.x,
                  yValueMapper: (ChartDataLine data, _) => data.y)
            ]),

            // SfCartesianChart(series: <ChartSeries>[
            //   StackedColumnSeries<ChartData, String>(
            //       dataSource: chartData,
            //       pointColorMapper: (ChartData data, _) => data.color,
            //       xValueMapper: (ChartData data, _) => data.x,
            //       yValueMapper: (ChartData data, _) => data.y),
            //   StackedColumnSeries<ChartData, String>(
            //       pointColorMapper: (ChartData data, _) => data.color,
            //       dataSource: chartData,
            //       xValueMapper: (ChartData data, _) => data.x,
            //       yValueMapper: (ChartData data, _) => data.y),
            // ])

            SfCartesianChart(
                primaryXAxis: CategoryAxis(desiredIntervals: 50),
                // primaryXAxis: NumericAxis(maximumLabelWidth: 90),
                series: <ChartSeries>[
                  StackedColumnSeries<ChartData1, String>(
                      dataSource: chartData1,
                      color: Colors.red,
                      xValueMapper: (ChartData1 data, _) => data.x,
                      yValueMapper: (ChartData1 data, _) => data.y1),
                  StackedColumnSeries<ChartData1, String>(
                      dataSource: chartData1,
                      color: Colors.blue,
                      xValueMapper: (ChartData1 data, _) => data.x,
                      yValueMapper: (ChartData1 data, _) => data.y2),
                ])
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class ChartDataLine {
  ChartDataLine(this.x, this.y, this.color);
  final int x;
  final double y;
  final Color color;
}

class ChartData1 {
  ChartData1(this.x, this.y1, this.y2);
  final String x;
  final int y1;
  final int y2;
}
