import 'package:binance_implementation/config/themes/primary_config.dart';
import 'package:binance_implementation/data/models/criptos/response/criptos_response_model.dart';
import 'package:binance_implementation/presentation/providers/home/home_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BarChartCoins extends ConsumerStatefulWidget {
  BarChartCoins({super.key});

  List<Color> get availableColors => const <Color>[
    PrimaryConfig.contentColorPurple,
    PrimaryConfig.contentColorYellow,
    PrimaryConfig.contentColorBlue,
    PrimaryConfig.contentColorOrange,
    PrimaryConfig.contentColorPink,
    PrimaryConfig.contentColorRed,
  ];

  final Color barBackgroundColor = PrimaryConfig.contentColorWhite.withOpacity(0.3);
  final Color barColor = PrimaryConfig.contentColorWhite;
  final Color touchedBarColor = PrimaryConfig.contentColorGreen;

  @override
  ConsumerState<BarChartCoins> createState() => BarChartCoinsState();
}

class BarChartCoinsState extends ConsumerState<BarChartCoins> {

  final Duration animDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {

    
    Future.delayed(const Duration(seconds: 1), () {
      ref.read(cryptoProvider.notifier).getCrypto();
    });

    final List<CriptosResponseModel> cryptos = ref.watch(cryptoProvider).cryptoProviderModel;

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children:[

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BarChart(
              mainBarData(cryptos),
              swapAnimationDuration: animDuration,
            ),
          ),
                
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y, {double width = 22, List<int> showTooltips = const [],}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: widget.barColor,
          width: width,
          borderSide: const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(List<CriptosResponseModel> cryptos) => List.generate(cryptos.length, (i) {
    return makeGroupData(i, double.parse(cryptos[i].price));
  });

  BarChartData mainBarData(List<CriptosResponseModel> cryptos) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'BTC';
                break;
              case 1:
                weekDay = 'BNB';
                break;
              case 2:
                weekDay = 'ETH';
                break;
              case 3:
                weekDay = 'HBAR';
                break;
              case 4:
                weekDay = 'DOGE';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(cryptos),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('BTC ', style: style);
        break;
      case 1:
        text = const Text('BNB', style: style);
        break;
      case 2:
        text = const Text('ETH', style: style);
        break;
      case 3:
        text = const Text('HBAR', style: style);
        break;
      case 4:
        text = const Text('DOGE', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

}