import 'package:binance_implementation/data/models/criptos/response/criptos_response_model.dart';
import 'package:binance_implementation/domain/datasource/cryptos/crypto_datasource.dart';
import 'package:binance_implementation/domain/repository/cryptos/crypto_repository.dart';

class CryptoRepositoryImpl extends CryptoRepository {

  final CryptoDataSource cryptoDataSource;

  CryptoRepositoryImpl({
    required this.cryptoDataSource,
  });

  @override
  Future<CriptosResponseModel> getCrypto({required String symbol}) {
    try {
      return cryptoDataSource.getCrypto(symbol: symbol);
    } catch (e) {
      rethrow;
    }
  }

}