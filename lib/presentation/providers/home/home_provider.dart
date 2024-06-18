import 'package:binance_implementation/data/datasource/cryptos/crypto_datasource_impl.dart';
import 'package:binance_implementation/data/models/criptos/response/criptos_response_model.dart';
import 'package:binance_implementation/data/repository/cryptos/crypto_repository_impl.dart';
import 'package:binance_implementation/domain/repository/cryptos/crypto_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cryptoProvider = StateNotifierProvider<CryptoNotifier, CryptoProviderModel>((ref) => CryptoNotifier(
  cryptoRepository: CryptoRepositoryImpl(
    cryptoDataSource: CryptoDatasourceImpl()
  )
));

class CryptoProviderModel {

  List<CriptosResponseModel> cryptoProviderModel;

  CryptoProviderModel({
    required this.cryptoProviderModel
  });

}


class CryptoNotifier extends StateNotifier<CryptoProviderModel> {

  CryptoRepository cryptoRepository;

  CryptoNotifier({required this.cryptoRepository}) : super(CryptoProviderModel(cryptoProviderModel: []));


  Future<void> getCrypto() async {
    try {

      final cryptoBTC = await cryptoRepository.getCrypto(symbol: 'BTCUSDT');

      final cryptoBNB = await cryptoRepository.getCrypto(symbol: 'BNBUSDT');

      final cryptoETH = await cryptoRepository.getCrypto(symbol: 'ETHUSDT');

      final cryptoHBAR = await cryptoRepository.getCrypto(symbol: 'HBARUSDT');

      final cryptoDOGE = await cryptoRepository.getCrypto(symbol: 'DOGEUSDT');

      state = CryptoProviderModel(cryptoProviderModel: [
        cryptoBTC,
        cryptoBNB,
        cryptoETH,
        cryptoHBAR,
        cryptoDOGE
      ]);

    } catch (e) {
      rethrow;
    }
  } 
  
  
  
  
  
}