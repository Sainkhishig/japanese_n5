// чартын тусламж : https://help.syncfusion.com/flutter/cartesian-charts/axis-types
// import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:hishig_erdem/common_frame_practice/chart/test/test_chart_controller.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final int y;
}

// pyfm061 : キャンセル規定編集
class CommonTestChart extends HookConsumerWidget {
  CommonTestChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(testChartController.notifier);
    controller.setModelListenable(ref);
    print("build form");
    // useEffect(() {
    //   WidgetsBinding.instance?.addPostFrameCallback((_) {
    //     controller.setGrammarList();
    //   });
    //   // return controller.dispose;
    // }, const []);

    // if (controller.testState.grammarTestSource.isEmpty) {
    //   return showEmptyDataWidget();
    // }

    // TestChartModel testChart = controller.state.selectedTestChart;
    // var jlptLevel = controller.prefs.getInt("jlptLevel");
    final List<SalesData> chartData = [
      SalesData(DateTime.parse('2022-12-02'), 35),
      SalesData(DateTime.parse('2022-12-03'), 28),
      SalesData(DateTime.parse('2022-12-04'), 34),
      SalesData(DateTime.parse('2022-12-05'), 32),
      SalesData(DateTime.parse('2022-12-06'), 40)
    ];
    final List<SalesData> chartDataListening = [
      SalesData(DateTime.parse('2022-12-01'), 60),
      SalesData(DateTime.parse('2022-12-02'), 70),
      SalesData(DateTime.parse('2022-12-04'), 65),
      SalesData(DateTime.parse('2022-12-05'), 52),
      SalesData(DateTime.parse('2022-12-06'), 40)
    ];
    final List<ChartData> chartDataDate = <ChartData>[
      ChartData(DateTime(2022, 12, 1), 24),
      ChartData(DateTime(2022, 12, 1), 20),
      ChartData(DateTime(2022, 12, 2), 35),
      ChartData(DateTime(2022, 12, 3), 27),
      ChartData(DateTime(2022, 12, 4), 30)
    ];
    final List<ChartData> chartDataDate2 = <ChartData>[
      ChartData(DateTime(2022, 12, 1), 60),
      ChartData(DateTime(2022, 12, 2), 50),
      ChartData(DateTime(2022, 12, 3), 35),
      ChartData(DateTime(2022, 12, 3), 77),
      ChartData(DateTime(2023, 1, 4), 100)
    ];
    bool isChecked = false;
    return Scaffold(
        body: Center(
      child: Container(
          child: SfCartesianChart(
              tooltipBehavior: TooltipBehavior(enable: true),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 100),
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.yMd(),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                // multiLevelLabels: <DateTimeMultiLevelLabel>[
                //   DateTimeMultiLevelLabel(
                //       start: DateTime(2020, 1, 1),
                //       end: DateTime(2022, 1, 1),
                //       text: 'First'),
                //   // DateTimeMultiLevelLabel(
                //   //     start: DateTime(2022, 1, 1),
                //   //     end: DateTime(2024, 1, 1),
                //   //     text: 'Second'),
                //   // DateTimeMultiLevelLabel(
                //   //     start: DateTime(2020, 1, 1),
                //   //     end: DateTime(2022, 1, 1),
                //   //     text: 'Third',
                //   //     level: 1),
                //   // DateTimeMultiLevelLabel(
                //   //     start: DateTime(2022, 1, 1),
                //   //     end: DateTime(2024, 1, 1),
                //   //     text: 'Fourth',
                //   //     level: 1),
                // ]
              ),
              series: <ChartSeries<ChartData, DateTime>>[
            LineSeries<ChartData, DateTime>(
              name: "Ханз",
              dataLabelSettings: DataLabelSettings(isVisible: true),
              dataSource: chartDataDate,
              color: Colors.green,
              width: 3,
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 4,
                  width: 4,
                  shape: DataMarkerType.circle,
                  borderWidth: 4,
                  borderColor: Colors.green),
              enableTooltip: true,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            ),
            LineSeries<ChartData, DateTime>(
              name: "Сонсгол",
              dataLabelSettings: DataLabelSettings(isVisible: true),
              dataSource: chartDataDate2,
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 4,
                  width: 4,
                  shape: DataMarkerType.circle,
                  borderWidth: 4,
                  borderColor: Colors.amber),
              color: Colors.amber,
              width: 3,
              enableTooltip: true,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            )
          ])),
    ));
  }
}
