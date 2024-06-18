import 'package:binance_implementation/data/models/criptos/response/criptos_response_model.dart';

abstract class CryptoDataSource {

  Future<CriptosResponseModel> getCrypto({required String symbol});

}