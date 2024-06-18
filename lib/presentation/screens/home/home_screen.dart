import 'package:binance_implementation/data/models/criptos/response/criptos_response_model.dart';
import 'package:binance_implementation/presentation/providers/home/home_provider.dart';
import 'package:binance_implementation/presentation/screens/home/widgets/bar_chart_coins.dart';
import 'package:flutter/material.dart';
import 'package:binance_implementation/config/themes/primary_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {

  static const String path = '/home';
  static const String pathName = 'home';

  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}


class HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(cryptoProvider.notifier).getCrypto();
  }

  @override
  Widget build(BuildContext context) {

    final List<CriptosResponseModel> cryptos = ref.watch(cryptoProvider).cryptoProviderModel;

    return Scaffold(
      backgroundColor: PrimaryConfig.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: cryptos.isEmpty
              ? const SizedBox(
                  height: 400,
                  child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              : Column(
                children: [

                  const SizedBox(height: 40),
                      
                  const Center(
                    child: Text(
                      'Crypto Coins',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  BarChartCoins(),

                  const SizedBox(height: 80),

                  Column(
                    children: cryptos.map((crypto) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${crypto.symbol} =',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            crypto.price,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

